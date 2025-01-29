#!/bin/bash

USAGE=$(
    cat <<ENDUSE
Usage: $0 [ -m <message> ]
Commit and push all changed files
ENDUSE
)

# Assuming utils.sh provides functions like gitCurrentBranch, pvar_declare, etc.
# . GIT/scripts/UTILS/SRC/utils.sh

THE_CMD_LINE_MSG=""
BRANCH=$(gitCurrentBranch)

# Default message if not provided
pvar_context $(script)-$(gitrootns)
pvar_declare MESSAGE "no commit message"

doit() {
    if [ -z "$THE_CMD_LINE_MSG" ]; then
        THE_CMD_LINE_MSG=$(pvar_get MESSAGE)
        hitAnyKeyToContinue "continue with commit message: <$THE_CMD_LINE_MSG>"
    else
        pvar_set MESSAGE "$THE_CMD_LINE_MSG"
    fi

    FINALMSG="<$BRANCH>: $THE_CMD_LINE_MSG"

    errecho "COMMIT AND PUSH:"
    errecho "-    $BRANCH"
    errecho "COMMIT MESSAGE:"
    errecho "-    $FINALMSG"
    errecho

    gitcandpfn "$FINALMSG"
}

main() {
    eval $(valopt --rem "<message> - message used during commit to git" -m THE_CMD_LINE_MSG "$@")
    errifopt "$@"
    chkargcount 0 0 "$@"

    doit
}

main "$@"
