#!/bin/bash4
: '
╔═════════════════╦════════════════════════════════════════╗
║ Syntax          ║ Result                                 ║
╠═════════════════╬════════════════════════════════════════╣
║ arr=()          ║ Create empty array                     ║
║ arr=(1 2 3)     ║ Initialize array                       ║
║ ${arr[2]}       ║ Retrieve third element                 ║
║ ${arr[@]}       ║ Retrieve all elements                  ║
║ ${!arr[@]}      ║ Retrieve array indices                 ║
║ ${#arr[@]}      ║ Calculate array size                   ║
║ arr[0]=3        ║ Overwrite 1st element                  ║
║ arr+=(4)        ║ Append value(s)                        ║
║ str=$(ls)       ║ Save ls output as string               ║
║ arr=( $(ls) )   ║ Save ls output as array of files       ║
║ ${arr[@]:s:n}   ║ Elements at indices n to s+n           ║
║ ${str//ab/c}    ║ For a given string, replace ab with c  ║
║ ${arr[@]//ab/c} ║ For each array item, replace ab with c ║
╚═════════════════╩════════════════════════════════════════╝
'

#allThreads=(1 2 4 8 16 32 64 128)
#echo ${allThreads[1]}

arrofstrs=('a' 'b' 'c')
emptyarr=()
#echo ${arrofstrs[1]}

# looping over array elements
for t in ${arrofstrs[@]}; do
    echo $t
done

# loop over array indices
# adding an exclamation mark will return the list of all array indices
# where you need to know both the index and the value within a loop
for i in ${!arrofstrs[@]}; do
    emptyarr+=($i)
    echo ${arrofstrs[$i]}
done

echo ${emptyarr[@]}

for int in {1..10}; do
    echo $int
done

: '
# bash v4 Associative arrays - http://tldp.org/LDP/abs/html/bashver4.html
# -A option declares associative array.

#declare -A assocarr

assocarr[a]='Aa'
assocarr[b]='Ab'
assocarr[c]='Ac'

echo ${assocarr[b]}
'