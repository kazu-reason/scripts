WINCMD="$HOME/scripts/alias4win/wincmd.txt"
ALIAS="$HOME/.aliases/alias4win"

# windowsのコマンドをwincmd.txtに追加
vim $WINCMD

echo "" > $ALIAS 
while read line
do
    cnt=`expr $cnt + 1`
    echo "alias $line='$line.exe'" >> $ALIAS
done < $WINCMD

# aliasを追加
. $ALIAS
