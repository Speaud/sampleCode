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

NO_ARGS=0
E_OPTERROR=2


DisplayHelp() {
    echo "Usage: `basename $0` options (-mnopqrs)"
    echo \\n"Documentation: ..."\\n
    echo "Basic usage: "\\n
    echo \\t"Run this script from within the root of the local privacy app instance"\\n
    echo "Opts: "\\n
    echo \\t"-u (optional)"\\t"username for docker login"\\n
    echo \\t"-p (optional)"\\t"password for docker login"\\n
    echo \\t"-d (optional)"\\t"if opt arg equal 1, dual deployment runs"\\n
    exit 1
}


# $# = number of arguments
[ $# -eq "$NO_ARGS" ] && ( DisplayHelp; exit 1 )

while getopts ":mnopq:rs" Option
do
    case $Option in
        m     ) echo "Scenario #1: option -m-   [OPTIND=${OPTIND}]";;
        n | o ) echo "Scenario #2: option -$Option-   [OPTIND=${OPTIND}]";;
        p     ) echo "Scenario #3: option -p-   [OPTIND=${OPTIND}]";;
        q     ) echo "Scenario #4: option -q-\
        with argument \"$OPTARG\"   [OPTIND=${OPTIND}]";;
        #  Note that option 'q' must have an associated argument,
        #+ otherwise it falls through to the default.
        r | s ) echo "Scenario #5: option -$Option-";;
        *     ) echo "Unimplemented option chosen.";;   # Default.
    esac
done

shift $(($OPTIND - 1))
#  Decrements the argument pointer so it points to next argument.
#  $1 now references the first non-option item supplied on the command-line
#+ if one exists.

exit $?



