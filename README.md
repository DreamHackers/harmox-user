# Summary

[![Join the chat at https://gitter.im/springhackathon/harmox-user](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/springhackathon/harmox-user?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Circle CI](https://circleci.com/gh/springhackathon/harmox-user/tree/master.svg?style=svg)](https://circleci.com/gh/springhackathon/harmox-user/tree/master)
[![Build Status](https://travis-ci.org/springhackathon/harmox-user.svg)](https://travis-ci.org/springhackathon/harmox-user)
[![Code Climate](https://codeclimate.com/github/springhackathon/harmox-user/badges/gpa.svg)](https://codeclimate.com/github/springhackathon/harmox-user)
[![Dependency Status](https://gemnasium.com/springhackathon/harmox-user.svg)](https://gemnasium.com/springhackathon/harmox-user)
[![Inline docs](http://inch-ci.org/github/springhackathon/harmox-user.svg?branch=master)](http://inch-ci.org/github/springhackathon/harmox-user)

# Detail

|project|detail|
|:--:|:--:|
|harmox-script|スクリプト|
|harmox-admin|管理画面|
|harmox-user|ユーザ画面|
|harmox-analytics|分析画面|

# ルール

## Issues
* 気になったことを乱雑でもいいのでこれでチケットを作る
* ラベル、優先度だけは何かしらつけてほしい
* 担当者、とかマイルストーンは確定していれば付ける

## 開発の流れ
1. Issuesで作成したものを元に優先度を加味し開発を進める
* 対応中のチケットには「対応中」とコメントを残す。さらに対応時に発生したことなどをそこにコメント残しておく
* Issuesに#の番号が隣についているので、それをコミットする時に付与すること

2. 設定ファイルを保存する時
* centos/configに保存して下さい
* `scp -i ~/key/hogehoge.pem -P 22 ec2-user@XX.XX.XX.XX:~/app/hogehoge.conf ./`

## ラベルについて
* 大体以下のような形で
* ラベルを追加したらここに追記して下さい
 
### 必須ラベル

|label|詳細|
|:--:|:--:|
|admin|管理画面タスク|
|analytics|分析画面タスク|
|archi|アーキテクチャ,ベースとなるもの|
|batch|バッチ機能タスク|
|infra|インフラタスク|
|user|ユーザ画面タスク|
|manage|非機能要件。例）契約|
|script|スクリプトタスク|

### 任意ラベル

|label|詳細|
|:--:|:--:|
|bug|バグタスク|
|design|デザインタスク|
|fix|バグより優先度は低いが、いつか治したいタスク|
|question|質問タスク→担当者を入れる|
|todo|TODOタスク|
|want|余裕があれば、入れたい|

# Testing

## first
`bundle install`

## env
* rspec
* guard

## started
画面を2つ用意する

### 1つ目のコンソール
* `bundle exec guard`

### 2つ目のコンソール
開発

* 1つ目のコンソールを見ながらエラーが出ていないか判断する  
* spec以下のテストコードを実装して、単体レベルのテストも行う

### サンプル
```
Finished in 0.08675 seconds (files took 6.31 seconds to load)
15 examples, 0 failures, 11 pending

# この例では、15個のテストがあり、そのうち0個の失敗と、11個の待機がある。
# 要は、4個以外のテストはペンディングされているので、こいつは治す必要がある。
```
