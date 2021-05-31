#!/bin/bash
set -e

KEY=$HOME/.ssh/id_rsa

if [[ -f "$KEY" ]]; then
  chmod -R 600 $HOME/.ssh/*
  eval "$(ssh-agent -s)"
  ssh-add $KEY
  ssh-add -l
else
  echo "!!!NOTICE: $KEY not found!"
fi

/deploy/vendor/bin/dep "$@"
