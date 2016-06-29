#!/usr/bin/env perl
# 
# screenやtmuxで新しいWindowでssh接続をするスクリプトです。
#
# [使用例]
#   user@host に接続する
#   $ nwssh user@host
#
#   user@host に接続し、タイトルをTITLEに設定する
#   $ nwssh TITLE user@host
#
#   user@host に接続し、タイトルをTITLEに設定し、Agent forwardingを有効にする
#   $ nwssh TITLE -A user@host
#
use utf8;
use strict;
use warnings;
binmode(STDIN,':utf8');
binmode(STDOUT,':utf8');

if($#ARGV==-1) {
	print "USAGE: $0 ([title] [sshd args]) | ([sshd args])\n";
	exit;
}
my ($title,@cmd);

if($#ARGV==0) {
	$title=$ARGV[0];
	$title=~s/^(.+?)\@//;
} else {
	$title=shift @ARGV;
}

if($ENV{TMUX}) {
	exec('tmux','new-window',"-n",$title,"ssh",@ARGV);
} elsif ($ENV{TERM} eq 'screen') {
	exec('screen','-t',$title,'ssh',@ARGV);
} else {
	exec('ssh',@ARGV);
}

