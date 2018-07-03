#~/bin/bash

amp() { export AWS_PROFILE="$1"; }
amr() { export AWS_REGION="$1"; }

_regions() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(aws ec2 describe-regions --query 'Regions[][RegionName]' --output text)" -- $cur) )
}

_profile() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(grep '\[profile ' ~/.aws/config | sed -e 's/\[profile //' -e 's/\]//')" -- $cur) )
}

complete -F _profile amp
complete -F _regions amr
