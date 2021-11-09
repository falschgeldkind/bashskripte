#!/bin/bash
### Renames files based on a lookup table. The table describes what file has which name after renaming
# Format:
#   "
#   1st_current_filename 1st_new_filename
#   2nd_current_filename 2nd_new_filename
#   [...]
#   " 
   
names=/PATH/TO/LOOKUP/TABLE

cat $names | while read line ; do echo $line | while read number name; do mv ./$(echo $number) ./$(echo $name); done; done

