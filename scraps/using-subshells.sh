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
    echo "$BASH_SUBSHELL - GlobalScopeFunction"
}

GlobalScopeFunctionWithSubshellProcess() {
    (
        echo "$BASH_SUBSHELL - GlobalScopeFunctionWithSubshellProcess"
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

    (
        echo ".....start child process >>>" # 1
        
        echo "$BASH_SUBSHELL - INNER"
        
        GlobalScopeFunction
        
        GlobalScopeFunctionWithSubshellProcess

        (
            echo "$BASH_SUBSHELL - INNER INNER"
            
            GlobalScopeFunction
            
            GlobalScopeFunctionWithSubshellProcess
        )

        echo ".....<<< end child process"
    )

    echo "<<< end loop"
done

# Don't execute the next command until subshells finish
wait

echo "ALL DONE!"