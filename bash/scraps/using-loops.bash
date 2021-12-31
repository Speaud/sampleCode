mnt=( t u v w x y z )

## free up local drives#

for mnt in ${mnt[@]}
do
  net use $mnt: //delete //yes
done

###

DATE="1988/10/17"

declare -a DAYS_REQUESTED

FROMHERE=10

for i in $(seq $FROMHERE 0)
do
    DAYS_REQUESTED+=( $(date -j -f %Y/%m/%d -v+"$i"d $DATE +'%-Y/%-m/%d') )
done

echo ${#DAYS_REQUESTED[@]}
echo ${DAYS_REQUESTED[@]}

# change all file extensions from sh to bash
for f in *.sh; do mv -- "$f" "${f%.sh}.bash"; done