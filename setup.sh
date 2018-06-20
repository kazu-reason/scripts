#!/bin/sh

# スクリプトをどこからでも叩けるようにaliasファイルを作成

SCRIPTS_DIR="$HOME/scripts/"
ALIAS_FILE="$HOME/.aliases/alias4scripts"

if [ -e $ALIAS_FILE ]; then
    rm $ALIAS_FILE
fi

for dir_path in `find $SCRIPTS_DIR* -maxdepth 0 -type d`; do
    dir_name=`basename $dir_path`
    if [ -e "${dir_path}/this_cmd" ]; then
      this_cmd=`cat ${dir_path}/this_cmd`
      this_alias="alias ${dir_name}='${this_cmd}'"
    else
      this_alias="alias ${dir_name}='. ${dir_path}/${dir_name}.sh'"
    fi
    echo $this_alias >> $ALIAS_FILE
done
