#!/bin/sh

# スクリプトをどこからでも叩けるようにaliasファイルを作成

SCRIPTS_DIR="$HOME/scripts/"
ALIAS_FILE="$HOME/.aliases/alias4scripts"

if [ -e $ALIAS_FILE ]; then
    rm $ALIAS_FILE
fi

for dir_path in `\find $SCRIPTS_DIR* -maxdepth 0 -type d`; do
    dir_name=`basename $dir_path`
    sh_path=${dir_path}/${dir_name}.sh
    echo "alias $dir_name='. $sh_path'" >> $ALIAS_FILE
done
