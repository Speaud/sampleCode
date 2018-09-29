mnt=( t u v w x y z )

## free up local drives#

for mnt in ${mnt[@]}
do
  net use $mnt: //delete //yes
done
