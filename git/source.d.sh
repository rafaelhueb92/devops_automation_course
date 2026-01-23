#!/bin/bash

CONFIG_FILE=$([[ "$OSTYPE" == "darwin"* ]] && echo "$HOME/.zshrc" || echo "$HOME/.bashrc")

cp functions $HOME
echo -e "source ~/functions" >> $CONFIG_FILE

source $CONFIG_FILE
