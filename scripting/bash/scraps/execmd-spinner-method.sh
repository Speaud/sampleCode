#######################################
#	...
#	Globals: $ERRLOG, $MNTDRIVE
#		Arguments:
#			{command|int}					as $1, {any terminal or bash command to be executed|index number of frequently used command}
#			{string|drive letter}	as $2, any information to be displayed to the user while $1 is running
#			{mount}							as $3, Ex. HAYSDATTC01\webapps
#		Notes: Comes with built in error handling
#######################################	
ExeCmd(){
	local msg=""; local mnt;
	case $1 in
		## Mount
		0) [[ $4 ]] && msg+=$4 || msg+="Mounting $3"; (net use $2: $3 /user:"$SVRUN" "$SVRPW") 1>/dev/null 2>$ERRLOG & ;;
		## Unmount
		1) [[ $3 ]] && msg+= $3 || msg+="Cleaning $2 drive"; (net use $2: //delete //yes) 1>/dev/null 2>$ERRLOG & ;;
		## Clear local drives that are needed to run this script if they are already in use
		2)
			msg+="Cleaning required local drives"
			[[ $(net use | egrep -c "\bno\b\s\bentries\b") -lt 1 ]] && {
				for mnt in ${MNTDRIVE[@]}
				do
					[[ $(net use | egrep -c "$mnt\:") -gt 0 ]] && ExeCmd 1 $mnt
				done
			} || {
				## None of the required drives are mounted so move along, if not script will break on empty PID
				local skipprompt=1
			}
			;;
		## Default
		*) msg+=$2; (eval $1) 1>/dev/null 2>$ERRLOG & ;;
	esac
	[[ $skipprompt -ne 1 ]] && {
		local pid=$!
		local sp="/-\!"
		printf "$OPROMPT $msg [ "
		while [ "$(ps a | awk '{print $pid}' | grep $pid)" ]; do
			printf "\b${sp:a++%${#sp}:1}]\b"
			sleep 0.05
		done
		[[ $(egrep -c '[a-zA-Z0-9]*' $ERRLOG) -ne 0 ]] && { printf "\b\e[91m\u00D7$ODEFAULT]\n"; PromptUsr 4 "See $ERRLOG for more information."; } || printf "\b\e[32m\u2713$ODEFAULT]\n"
	}
}
	floor() {
	  DIVIDEND=${1}
	  DIVISOR=${2}
	  RESULT=$(( ( ${DIVIDEND} - ( ${DIVIDEND} % ${DIVISOR}) )/${DIVISOR} ))
	  echo ${RESULT}
	}

	timecount(){
	  s=${1}
	  HOUR=$( floor ${s} 60/60 )
	  s=$((${s}-(60*60*${HOUR})))
	  MIN=$( floor ${s} 60 )
	  SEC=$((${s}-60*${MIN}))
	  while [ $HOUR -ge 0 ]; do
      while [ $MIN -ge 0 ]; do
          while [ $SEC -ge 0 ]; do
            printf "$sii Deploying to Test in %02d:%02d:%02d\033[0K\r" $HOUR $MIN $SEC
            SEC=$((SEC-1))
            sleep 1
          done
        SEC=59
        MIN=$((MIN-1))
      done
      MIN=59
      HOUR=$((HOUR-1))
	  done
	  printf "\n"
	}  	
	
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