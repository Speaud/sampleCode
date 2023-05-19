#!/bin/bash

sandbox_file='bash/sandbox.txt'

# cat bash/sandbox.txt

# printf "\n---\n"

# cat bash/sandbox.txt | awk -F '--' '{print $1}'
# awk -F '--' '{print $1}' bash/sandbox.txt
# foo=$(awk -F '--' '{print $1}' bash/sandbox.txt)
# f=($(awk -F '--' '{print $1}' bash/sandbox.txt))

# echo $foo
# echo ${f[1]}
# echo ${f[@]}

##### 

# for i in ${foo[@]}
# do
#   echo $i
# done

####

# https://www.geeksforgeeks.org/column-command-in-linux-with-examples/

# column -t -s '--' $sandbox_file

# `column: line too long`
# column requires every line to end with a new-line, if the input ends without a new-line column will produce the line too long error observed. 

# @note may be mac specific, rework may be required
# sed 's/sssssssssssssssssssss//g' bash/sandbox.txt


# https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html
# sed -e 's/[[:alnum:]]//g' bash/sandbox.txt
# sed -e 's/[[:digit:]]//g' bash/sandbox.txt
# sed -e 's/[[:digit:]]//g' bash/sandbox.txt

# printf "\n---\n"

# | sed -E -e 's/\-([[:alnum:]]|\-)*//')

column -t -s '--' $sandbox_file
# column $sandbox_file

# today=`date +%m-%d-%Y`

# echo $today