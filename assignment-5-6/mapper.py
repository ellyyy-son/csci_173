#!/usr/bin/python

import sys
import re

books = set()
current_book = None

for line in sys.stdin:
    line = line.strip()

    if line.startswith("Book "):
        line = re.match(r"^\w+\s+\d*", line)
        books.add(line)
        current_book = line
        continue
    
    if current_book is None:
        continue

    line = re.sub(r"^\d+:\d+:\d+\s*", "", line)

    keys = line.split()

    for key in keys:
        value = 1
        print( "%s\t%d" % (current_book, value) )
