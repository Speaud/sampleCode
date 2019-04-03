# this is a workaround for using long getopts arguments
while [[ $# -gt 0 ]]; do
    
    opt="$1"
    shift;
    current_arg="$1"
    
    [[ "$current_arg" =~ ^-{1,2}.* ]] && echo "WARNING: You may have left an argument blank. Double check your command."
    
    case "$opt" in
        "-a"|"--apple"      ) APPLE="$1"; shift;;
        "-b"|"--banana"     ) BANANA="$1"; shift;;
        "-e"|"--eggplant"   ) echo "$opt = $1" ; shift;;
        "-f"|"--fig"        ) FIG="$1"; shift;;
        *                   ) echo "ERROR: Invalid option: $opt"
        exit 1;;
    esac
done

if [[ "$APPLE" == "" || "$BANANA" == "" ]]; then
    echo "ERROR: Options -a and -b require arguments."
    exit 1
fi