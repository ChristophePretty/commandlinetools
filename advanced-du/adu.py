#!/usr/bin/python3

import os
import sys
from optparse import OptionParser


def humanreadable(n):
    ext = ['B', 'K', 'M', 'G', 'T']

    def _humanreadable(n, ext):
        if len(ext) > 1 and n > 1024:
            return _humanreadable((int)(n / 1024), ext[1:])
        return '{}{}'.format(n, ext[0])

    return _humanreadable(n, ext)


def do_all(rootpath, withfiles, human, minsize, exclude):
    stats = {}
    totalsize = 0
    for (dirpath, dirnames, filenames) in os.walk(rootpath):
        if exclude and dirpath[:len(exclude)] == exclude:
            continue
        # print('{} {} {}'.format(dirpath, dirnames, filenames))
        size = 0
        try:
            for f in filenames:
                fullpath = os.path.join(dirpath, f)
                fsize = os.path.getsize(fullpath)
                size += fsize
                if withfiles and fsize > minsize:
                    stats[fullpath] = fsize
        except Exception as e:
            sys.stderr.write('Error reading: {} => {}\r'.format(dirpath, e))
            size = -1
        if size > minsize:
            stats[dirpath] = size
        if size > 0:
            totalsize += size
        sys.stderr.write('{}\r'.format(dirpath))

    print("Results:")
    for k in sorted(stats, key=stats.get, reverse=False):
        print('{:12} {}'.format(humanreadable(stats[k]) if human else stats[k], k))
    print("Total size: {}".format(humanreadable(totalsize) if human else totalsize))


parser = OptionParser()
parser.add_option("-f", "--include-files", action="store_true", default=False, dest="withfiles",
                  help="Include file size")
parser.add_option("-r", "--human-readable", action="store_true", default=True, dest="human", help="Include file size")
parser.add_option("-x", "--exclude", default='', dest="exclude", help="Exclude dir")
parser.add_option("-m", "--min-size", default='0', dest="minsize", help="Minimum size in report")
(options, args) = parser.parse_args()
# print(options, args)


root = os.getcwd()
if len(args) >= 1:
    root = args[0]

minsize = 0
if options.minsize != "0":
    s = options.minsize[:-1]
    e = options.minsize[-1:]
    if e == 'K':
        minsize = int(s) * 1024
    elif e == 'M':
        minsize = int(s) * 1024 * 1024
    elif e == 'G':
        minsize = int(s) * 1024 * 1024 * 1024
    elif e == 'T':
        minsize = int(s) * 1024 * 1024 * 1024 * 1024
    else:
        minsize = int(options.minsize)

do_all(root, options.withfiles, options.human, minsize, options.exclude)
