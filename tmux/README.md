# tmux

* [.tmux.conf](.tmux.conf)

# インストール

OSW(Homebrew)

	$ brew install tmux

# コマンド

プリフィックス・キー
CTRL+B(C-b)

内容                | コマンド
--------------------|----------------------
ウィンドウ 新規     | C-b c
ウィンドウ 次       | C-b n
ウィンドウ 前       | C-b p
ウィンドウ 直前     | C-b l
ウィンドウ 数字     | C-b [数字]
ウィンドウ 一覧     | tmux list-window
ウィンドウ 強制終了 | C-b &	
ウィンドウ 名前変更 | C-b ,

内容                | コマンド
--------------------|--------------------------
ペイン 水平分割     | C-b "
ペイン 垂直分割     | C-b %
ペイン 次           | C-b o
ペイン 一覧         | C-b q (表示中[数字]で移動)
ペイン 強制終了     | C-b x
ペイン 入れ替え     | C-b C-o

内容                | コマンド
--------------------|--------------------------
ウィンドウ名 変更   | C-b + ,
クライアント 一覧   | tmux lsc
キー一覧            | C-b + ?

内容                | コマンド
--------------------|--------------------------
セッション 名前変更 | C	-b $
セッション デタッチ | C	-b d
セッション アタッチ | tmux a -t [セッション名]
セッション アタッチ | tmux a
セッション 確認     | tmux ls

## 他のペインを持ってくる

	tmux join-pane -s :[Win番号].[Pane番号]

[tmuxのjoin-paneからpaneの指定方法を学ぶ](http://d.hatena.ne.jp/kozo2/20111202/1322827858)

## OSXペーストボードとの連携

[reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) というアプリケーションが必要

	$ brew install reattach-to-user-namespace

.tmux.conf に以下の設定をすれば、次のようなキーバインドでコピーができる。

	# コピーモードを設定する
	## viのキーバインドを使用する
	setw -g mode-keys vi
	## クリップボード共有を有効にする
	set-option -g default-command "reattach-to-user-namespace -l zsh"
	## コピーモードの操作をvi風に設定する
	bind-key -t vi-copy v begin-selection
	bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
	unbind -t vi-copy Enter
	bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

内容                | コマンド
--------------------|--------------------------
コピーモード 開始   | C-b [
コピー開始位置指定  | Space
コピー開始位置指定  | v
コピー終了位置指定  | Enter
コピー終了位置指定  | y
コピーモード 終了	  | C-b ]	

[達人に学ぶ.tmux.confの基本設定](http://qiita.com/succi0303/items/cb396704493476373edf)

[tmuxでクリップボードにコピーする](http://qiita.com/c8112002/items/71361e347e430f9bb14e)

[tmux のコピーモードを使ってみる](http://inokara.hateblo.jp/entry/2013/07/04/233051)

## リモートのtmuxのコピーしたバッファを手元にコピーする

	$ ssh user@hostname 'tmux save-buffer - ' | pbcopy

## tmux起動と同時に縦に分割して最初のペインに戻る

	$ tmux new-session \; split-window -h \; select-pane -t :.0

# 設定ファイル

[達人に学ぶ.tmux.confの基本設定](http://qiita.com/succi0303/items/cb396704493476373edf)

# 参考URL

[GNU Screen ライクなターミナルマルチプレクサ「tmux」を使う](http://d.hatena.ne.jp/eco31/20101126/1290725841)

[tmuxの基本的な使い方とコマンドのまとめ](http://www.task-notes.com/entry/20150711/1436583600)

