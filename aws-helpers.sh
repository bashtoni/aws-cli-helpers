#~/bin/bash

amp() { export AWS_PROFILE="$1"; }
amr() { export AWS_REGION="$1"; export AWS_DEFAULT_REGION="$1"; }
amc() {
    unset AWS_REGION
    unset AWS_PROFILE
    unset AWS_DEFAULT_REGION
    unset AWS_DEFAULT_PROFILE
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
}

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
