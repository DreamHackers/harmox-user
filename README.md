# 単体テスト

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
