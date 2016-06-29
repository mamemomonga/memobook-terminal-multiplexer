# mux-ssh-agent

ssh-agent関係の環境変数を引き継いで screenやtmuxを起動する。

* ssh-agentが起動していなければ、起動してSSH_AUTH_SOCK などの情報をファイルに保存する

* ファイルがあれば、SSH_AUTH_SOCKなどの環境変数を復元し、attachする。

* ファイルがあってもプロセスがなければファイルを削除し ssh-agentの起動をやり直します。

## 実行例

USER@REMOTE の /home/USER/bin に mux-ssh-agent をおいて、実行権限をつけておく

mosh(mobile-shell) を使用する場合

	$ mosh USER@REMOTE /home/USER/bin/mux-ssh-agent tmux

	$ mosh USER@REMOTE /home/USER/bin/mux-ssh-agent screen

ssh をつかって起動する場合は -t オプションが必要

	$ ssh -t USER@REMOTE /home/USER/bin/mux-ssh-agent tmux

	$ ssh -t USER@REMOTE /home/USER/bin/mux-ssh-agent screen

alias か exec をつかったシンプルなコマンドを用意しておくとよい

## 問題点

tmux, screenのセッションを検知するわけではなく、ssh-agentの起動状態からnew session, attachを判別しているため、不整合が起こる場合がある。

