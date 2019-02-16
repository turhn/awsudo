#compdef awsudo

# Description:
# Auto completion script for https://github.com/makethunder/awsudo/tree/master/awsudo
#
# Author:
# @turhn https://github.com/turhn

local curcontext="$curcontext" state line ret=1
typeset -A opt_args

_arguments -C '1:subcommands:->cmds' \
              '2:profiles:->profile_list' \
              '3:targets: _command_names' \
              '*:: :->target' \
              && ret=0

case "$state" in
(cmds)
  local commands; commands=(
    '-u: AWS Profile'
  )

  _describe -t commands 'command' commands && ret=0
;;
(profile_list)
  local profiles; profiles=(
    $(grep "\[" ~/.aws/credentials | tr -d "[" | tr -d "]")
  )
  _describe -t profiles 'profiles' profiles && ret=0
;;
(target)
  ((CURRENT--))
  shift words
  shift words
  _complete && ret=0
;;
esac

return $ret

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
