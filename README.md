# Bash scraps

There isn't a compile or build process for all of this so there isn't much to the directory structure. This is essentially a place for me to keep "bash scraps" and what-have-you.

Recursively search and place string in any directory despite structure
```
grep -lR --exclude-dir=dirname 'matchPattern' path/to/dir/ | xargs sed -i "s/matchPattern/replacePattern/g"
```
