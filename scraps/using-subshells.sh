#!/bin/bash

: '
    about subshells - https://www.tldp.org/LDP/abs/html/subshells.html
    about child process - https://www.tldp.org/LDP/abs/html/othertypesv.html#CHILDREF2

    A "subshell" is a "child process"
'

mnt=( t u )

GlobalScopeFunction() {
    #epoch_timestamp=$(date +%s)
    #echo $epoch_timestamp > tmp/subshell-generated-file.$1.$epoch_timestamp.txt
    echo "$$ - $BASHPID - $PPID - $BASH_SUBSHELL - GlobalScopeFunction"
}

GlobalScopeFunctionWithSubshellProcess() {
    (
        echo "$$ - $BASHPID - $PPID - $BASH_SUBSHELL - GlobalScopeFunctionWithSubshellProcess"
    )
}

: '
for mnt in ${mnt[@]}
do
    (
        echo "SUBSHELL"
        GlobalScopeFunction $mnt

        GlobalScopeFunctionWithSubshellProcess

        echo "inner (lvl $BASH_SUBSHELL)"

        (
            echo "inner (lvl $BASH_SUBSHELL)"
        )
    )
done
'

for mnt in ${mnt[@]}
do
    echo "start loop >>>"

    echo $$ | (sh -c 'echo $PPID' && :)

    (
        #echo ".....start child process >>>" # 1

        #echo $$ $BASHPID

        echo $$ | (sh -c 'echo $PPID' && :)

        #echo $$; ( : ; bash -c 'echo $PPID' )

        #bash -c 'echo $PPID'
        
        #echo "$$ - $BASHPID - $PPID - $BASH_SUBSHELL - INNER" # 1
        
        #GlobalScopeFunction # 1
        
        #GlobalScopeFunctionWithSubshellProcess # 2

        (
            #echo "$$ - $BASHPID - $PPID - $BASH_SUBSHELL - INNER INNER" # 2
            
            #GlobalScopeFunction # 2
            
            #GlobalScopeFunctionWithSubshellProcess # 3

echo $PPID

            echo $$ | (sh -c 'echo $PPID' && :)
        )

        #echo ".....<<< end child process"
    )

    echo "<<< end loop"
done

# Don't execute the next command until subshells finish
wait

echo "ALL DONE!"