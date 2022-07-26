#!/usr/bin/env bash

languages=`echo "bash golang javascript lua ruby rust typescript" | tr ' ' '\n'`
core_utils=`echo "find mv cp sed ln" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`

read -p "Enter Query: " query

if printf "$languages" | grep -qs $selected; then
  query=`echo $query | tr ' ' '+'`
  echo curl cht.sh/$selected/$query
  curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done
else
  echo curl cht.sh/$selected~$query
  curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done
fi

