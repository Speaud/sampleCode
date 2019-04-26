# Recursively search and place string in any directory despite structure
grep -lR --exclude-dir=dirname 'matchPattern' path/to/dir/ | xargs sed -i "s/matchPattern/replacePattern/g"

# Pass stdout to a file 
ls -la > tmp/lsla.txt

# find some data the clean to writeable
read=$(grep "regex" path/to/src)
write=$(sed -r 's/match/replace/g;s/match/replace/g' <<< $read);