import sys
import re

books = set()
current_book = None

for line in sys.stdin:
    line = line.strip()

    if line.startswith("Book "):
        books.add(line)
        continue
    
    if line in books:
        current_book = line
        break

for line in sys.stdin:
    line = line.strip()

    if line in books:
        current_book = line

    line = re.sub(r"^\d+:\d+:\d+\s*", "", line)

    keys = line.split()

    for key in keys:
        value = 1
        print( "%s\t%d" % (current_book, value) )
