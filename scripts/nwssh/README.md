# nwssh.pl

screenやtmuxで新しいWindowでssh接続をするスクリプトです。

# 使用例

user@host に接続する
```
$ nwssh user@host
```
user@host に接続し、タイトルをTITLEに設定する
```
$ nwssh TITLE user@host
```

user@host に接続し、タイトルをTITLEに設定し、Agent forwardingを有効にする
```
 $ nwssh TITLE -A user@host
```
