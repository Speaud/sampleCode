<<README
	@title
	@version
	@author
	@description
	@documentation

    syntax
        GLOBAL_SCOPE_VAR
        local_scope_var
        ExecutionCommandFunction
        helperFunction

README

#!/bin/sh

DisplayHelp() {
    echo "Usage: `basename $0` options (-mnopqrs)"
}

# $# = number of arguments
[[ $# -eq 0 ]] && (
    echo "no args"
)
# $@ = what parameters were passed
# $? = was last command successful

# :a
# a:    with argument       -a <argument value>

# OPTSTRING

while getopts "m:nopq:rs" OPTION
do
    case $OPTION in
        m     ) echo "hello $OPTARG" ;;
        n | o ) echo "Scenario #2: option -$OPTION-   [OPTIND=${OPTIND}]";;
        p     ) echo "Scenario #3: option -p-   [OPTIND=${OPTIND}]";;
        q     ) echo "Scenario #4: option -q-\
        with argument \"$OPTARG\"   [OPTIND=${OPTIND}]";;
        #  Note that option 'q' must have an associated argument,
        #+ otherwise it falls through to the default.
        r | s ) echo "Scenario #5: option -$OPTION-";;
        *     ) echo "Unimplemented option chosen.";;   # Default.
    esac
done

shift $(($OPTIND - 1))
#  Decrements the argument pointer so it points to next argument.
#  $1 now references the first non-option item supplied on the command-line
#+ if one exists.

exit $?



