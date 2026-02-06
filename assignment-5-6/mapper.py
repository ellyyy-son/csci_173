#!/usr/bin/python

import sys
import re

book = None
for line in sys.stdin:
    line = line.strip()

    if line == "*** END OF THE PROJECT GUTENBERG EBOOK THE BIBLE, KING JAMES VERSION, COMPLETE ***":
        break

    if re.match(r"^0\d", line):
        book = line[:2]
        line = re.sub(r"^\d+:\d+:\d+\s*", "", line)
    
    if book is None:
        continue


    keys = line.split()

    for key in keys:
        value = 1
        print( "%s\t%d" % (book, value) )
