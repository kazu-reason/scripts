WINCMD="$HOME/scripts/alias4win/wincmd.txt"
ALIAS="$HOME/.aliases/alias4win"

echo "" > $ALIAS 
while read line
do
    cnt=`expr $cnt + 1`
    echo "alias $line='$line.exe'" >> $ALIAS
done < $WINCMD
