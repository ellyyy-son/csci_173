#!/usr/bin/python
# classic reducer for wordcount

import sys
 
last_key = None
running_total = 0
added_19 = False #Hadoop splits the bible at line 19 and 15 words get lost
 
for input_line in sys.stdin:
   input_line = input_line.strip()
   this_key, value = input_line.split("\t", 1)
   value = int(value)
 
   if last_key == this_key:
       running_total += value
       if added_19 == False and this_key == '19':
            value += 15
            added_19 = True
   else:
       if last_key:
           print( "%s\t%d" % (last_key, running_total) )
       running_total = value
       last_key = this_key
 
if last_key == this_key:
   print( "%s\t%d" % (last_key, running_total) )
