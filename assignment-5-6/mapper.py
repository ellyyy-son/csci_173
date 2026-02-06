#!/usr/bin/python

import sys
import re

books = set()
current_book = None

for line in sys.stdin:
    line = line.strip()

    if re.match(r"^0\d", line):
        current_book = line[:2]
    
    if current_book is None:
        continue

    line = re.sub(r"^\d+:\d+:\d+\s*", "", line)

    keys = line.split()

    for key in keys:
        value = 1
        print( "%s\t%d" % (current_book, value) )
