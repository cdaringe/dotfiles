#!/bin/bash
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

###-begin-fabulist-completions-###
#
# yargs command completion script
#
# Installation: fabulist completion >> ~/.bashrc
#    or fabulist completion >> ~/.bash_profile on OSX.
#
_yargs_completions()
{
    local cur_word args type_list

    cur_word="${COMP_WORDS[COMP_CWORD]}"
    args=("${COMP_WORDS[@]}")

    # ask yargs to generate completions.
    type_list=$(fabulist --get-yargs-completions "${args[@]}")

    COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )

    # if no match was found, fall back to filename completion
    if [ ${#COMPREPLY[@]} -eq 0 ]; then
      COMPREPLY=()
    fi

    return 0
}
complete -o default -F _yargs_completions fabulist
###-end-fabulist-completions-###


