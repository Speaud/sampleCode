# Bash scraps

Recursively search and place string in any directory despite structure
```
grep -lR --exclude-dir=dirname 'matchPattern' path/to/dir/ | xargs sed -i "s/matchPattern/replacePattern/g"
```
