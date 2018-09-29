## Utility to display information while debugging a complex script
#
# Examples
#
#	DebugUtility "arg1"
#		@returns	
#		arg1:
#			No Details
#
#	DebugUtility "arg1" "arg2"
#		@returns	
#		arg1:
#			arg2
#
#
#	DebugUtility "arg1" "arg2" "arg3" "arg4" ...
#		@returns	
#		arg1:
#			arg2
#			
#			[0]=${arg[3]}
#			[1]=${arg[4]}
#			[2]=${arg[...]}
#
DebugUtility(){
    [[ ! $2 ]] && msg="No Details" || msg=$2
    [[ $debug -eq 1 ]] && printf "\n$blubak$1:\n\t$msg$light"		
    [[ $3 ]] && {
        args=("$@")
        declare -i size=${#args[@]}-1;
        for ((i=0; i <= $size ; i++))	
        do
            [[ $i -gt 1 ]] && printf "$blubak\n\t[$(($i-2))] = \t${args[$i]}$light"
        done
    }	
}	