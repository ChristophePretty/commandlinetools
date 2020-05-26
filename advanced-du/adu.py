#!/usr/bin/python3

import os
from optparse import OptionParser


def humanreadable(n):
    ext = ['B', 'K', 'M', 'G', 'T']

    def _humanreadable(n, ext):
        if len(ext) > 1 and n > 1024:
            return _humanreadable((int)(n / 1024), ext[1:])
        return '{}{}'.format(n, ext[0])

    return _humanreadable(n, ext)


def do_all(rootpath, withfiles, human):
    stats = {}
    totalsize = 0
    for (dirpath, dirnames, filenames) in os.walk(rootpath):
        # print('{} {} {}'.format(dirpath, dirnames, filenames))
        size = 0
        try:
            for f in filenames:
                fullpath = os.path.join(dirpath, f)
                fsize = os.path.getsize(fullpath)
                size += fsize
                if withfiles:
                    stats[fullpath] = fsize
        except Exception as e:
            print('Error reading: {} => {}'.format(dirpath,e ))
            size = -1
        stats[dirpath] = size
        if size > 0:
            totalsize += size
        # print('{}\r'.format(dirpath), end="", flush=True)

    print("Results:")
    for k in sorted(stats, key=stats.get, reverse=False):
        print('{:12} {}'.format(humanreadable(stats[k]) if human else stats[k], k))
    print("Total size: {}".format(humanreadable(totalsize) if human else totalsize))


parser = OptionParser()
parser.add_option("-f", "--include-files", action="store_true", default=False, dest="withfiles",
                  help="Include file size")
parser.add_option("-r", "--human-readable", action="store_true", default=True, dest="human", help="Include file size")
(options, args) = parser.parse_args()
print(options, args)

root = os.getcwd()
if len(args) >= 1:
    root = args[0]
do_all(root, options.withfiles, options.human)
