## Declare Variables

## font and color indicators
high="\e[1;37;44m"
under_="\e[4m"
light="\033[0m"
sii="\e[32m>$light"
errwarn="\e[1;31;40m"

## arrays
## associative arrays (bash requires array declariations)
# ex. declare -A assocarrname

## misc
yn="(y/n)? "
nonzero='^[1-9]+$'
nowis=`date`
user=$(whoami)		