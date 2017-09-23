#!/usr/bin/env sh

if [ "$1" = "" ]; then
  echo "Usage"
  echo "  sync_ssh_keys.sh <user> <host> [<specific key base>]"
  exit
fi

if [ "$3" = "" ]; then
  KEY_FILE=*rsa
else
  KEY_FILE=$3
fi

scp $1@$2:~/.ssh/$KEY_FILE* ~/.ssh/
echo ""

if ! [ -e "~/.ssh/config" ]; then
  scp $1@$2:~/.ssh/config ~/.ssh/config
  echo ""
  cat ~/.ssh/config
  echo ""
fi

ls -al ~/.ssh | grep rsa
echo ""

echo "❤️ Done"
