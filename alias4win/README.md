# alias4windows setup 方法

## alias4windows  
Windows Subsystem for Linux(WSL)上で整備したLinuxの実行環境からWindowsのアプリケーションを呼び出し，実行することを実現するためのシェルスクリプト．

デフォルト状態のWSL上のbashからWindowsのアプリケーションを実行するためには`hoge.exe`のように.exeを末尾に付け足し，コマンド入力する必要がある．alias4windowsはaliasコマンドを利用し.exeの省略を可能にするスクリプトである．

## setup
1. [GitHub](https://github.com/kazu-reason)からシェルスクリプトが格納されたscriptsフォルダをhomeディレクトリ直下に配置する．
2. homeディレクトリ下にある.bashrcファイルにalias4windowsを読み込むための記述を追加する．
3. homeディレクトリ下に.aliasesディレクトリを作成する．
4. `~/scripts/alias4win/wincmd.txt`　に.exeを省略して呼び出したいwindowsのアプリケーションコマンドを追加する．
5. ターミナルを再起動する．

gitからcloneする
~~~
cd
git clone https://github.com/kazu-reason/.git
~~~

vimで.bashrcを開く
~~~
vim ~/.bashrc
~~~
.bashrcに追記する
~~~sh
if [ -f "$HOME/scripts/alias4win/alias4win.sh" ]; then
    . "$HOME/scripts/alias4win/alias4win.sh"
fi

if [ -f "$HOME/.aliases/alias4win" ]; then
    . "$HOME/.aliases/alias4win"
fi
~~~

.aliasesディレクトリを作成する
~~~
mkdir .aliases
~~~

.exeを省略したいコマンド名を記述する

~~~
vim ~/scripts/alias4win/wincmd.txt
~~~
```~/scripts/alias4win/wincmd.txt
explorer
clip
.
.
.
```


## 動作確認
wincmd.txtに記述したコマンドが.exeを省略して実行できるか確認する．
~~~
explorer
~~~
