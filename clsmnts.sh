<<README

@title                  JS Deploy
@author                 Joshua Mummert - speaud
@description    clean local mounts

README

#!/bin/bash
clear

printf "Cleaning mounts...\n"

mnt=( t u v w x y z )

## free up local drives#

for mnt in ${mnt[@]}
do
  net use $mnt: //delete //yes
done

printf "Cleaning mounts...OK"
