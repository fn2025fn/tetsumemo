# テーブル設計

## users テーブル

| カラム名             | 型       | Options                         |
|----------------------|----------|----------------------------------|
| id                   | integer  | primary_key                     |
| email                | string   | null: false, unique: true       |
| encrypted_password   | string   | null: false                     |
| name                 | string   | null: true                      |
| role                 | string   | null: true,default: 3           |
| created_at           | datetime | null: false                     |
| updated_at           | datetime | null: false                     |

- has_many :children

## children テーブル

| カラム名  | 型       | Options                             |
|-----------|----------|--------------------------------------|
| id        | integer  | primary_key                         |
| name      | string   | null: false                         |
| icon      | string   | ActiveStorageで管理（別テーブル）   |
| total_points | string   | default: 0, null: false          |
| user_id   | integer  | null: false, foreign_key: true      |
| created_at | datetime | null: false                        |
| updated_at | datetime | null: false                        |

- belongs_to :user
- has_many :task_logs

##  tasktemplates テーブル

| カラム名 | 型       | Options                        |
|----------|----------|-------------------------------|
| id       | integer  | primary_key                  |
| title    | string   | null: false                  |
| point    | integer  | default: 10, null: false     |
| created_at | datetime | null: false                |
| updated_at | datetime | null: false                |

- has_many :task_logs

##  tasklogs テーブル

| カラム名           | 型       | Options                                 |
|--------------------|----------|------------------------------------------|
| id                 | integer  | primary_key                             |
| child_id           | integer  | null: false, foreign_key: true          |
| task_template_id   | integer  | null: false, foreign_key: true          |
| image              | string   | ActiveStorageで管理（別テーブル）       |
| created_at         | datetime | null: false（記録日時として使う）       |
| updated_at         | datetime | null: false                             |
| title              | string   | null: false                                       |
- belongs_to :child
- belongs_to :task_template
- has_one_attached :image（ActiveStorage） 

## アプリケーション名

**Tasuki**

---

## アプリケーション概要

親が子どものお手伝い状況を管理できる「親子向けお手伝い記録・思い出共有アプリ」です。  
お手伝いの記録に応じてごほうびポイントが加算され、写真付きで思い出も残せます。

---

## アプリケーションを作成した背景

共働き家庭や育児中の親にとって、子どもの日々のお手伝いを把握・評価することは手間がかかります。本アプリは以下の課題を解決するために作成しました：

- 子どものお手伝い記録を簡単に残したい
- ご褒美のポイント制でやる気を引き出したい
- 思い出として写真も残しておきたい
- 親がストレスなく管理できるUIにしたい

---

## 利用方法

1. ユーザー（親）登録・ログイン
2. 子ども情報の登録（名前・アイコン）
3. お手伝い項目の作成（例：お皿洗い、洗濯物たたみ）
4. トップページで「お手伝い」＋「子ども」を選んでワンタップ登録
5. ごほうびポイントが自動加算
6. 子どものページで、進捗状況やごほうびポイントを確認
7. 思い出写真の登録も可能（記録のみ・ポイント加算なし）

---

## 実装機能と特徴

- **ユーザー認証機能（Devise）**  
  ログイン・新規登録により、親が個別に子の管理が可能
  新規登録
  [![Image from Gyazo](https://i.gyazo.com/c197a2c48c4a5da6b67aecf02d104539.gif)](https://gyazo.com/c197a2c48c4a5da6b67aecf02d104539)
  ログイン
  [![Image from Gyazo](https://i.gyazo.com/bd5b971bacea73e2b853a0353780dbe4.gif)](https://gyazo.com/bd5b971bacea73e2b853a0353780dbe4)

- **子どもアカウントの登録・編集・削除**  
  親が複数人の子どもを登録でき、個別に記録を管理可能
  新規登録１
  [![Image from Gyazo](https://i.gyazo.com/93f0f5975b8bf9640628c09608697e9f.gif)](https://gyazo.com/93f0f5975b8bf9640628c09608697e9f)
  
  新規登録２
  [![Image from Gyazo](https://i.gyazo.com/cff719bb6c1aa89a27e53a43f92d1d8c.gif)](https://gyazo.com/cff719bb6c1aa89a27e53a43f92d1d8c)
  
  編集
  [![Image from Gyazo](https://i.gyazo.com/bd6ee4eebf3cc745acf5afc6347ef47f.gif)](https://gyazo.com/bd6ee4eebf3cc745acf5afc6347ef47f)
  
  削除
  [![Image from Gyazo](https://i.gyazo.com/ef7a1389d1c0a42e33a1045ba5bd91a3.gif)](https://gyazo.com/ef7a1389d1c0a42e33a1045ba5bd91a3)
  
- **お手伝いテンプレートの作成・編集・削除**  
  親がよくあるお手伝いをテンプレートとして保存し、再利用可能。
  新規作成１
  [![Image from Gyazo](https://i.gyazo.com/0204cedb7dd1d2b307acd2309164edcd.gif)](https://gyazo.com/0204cedb7dd1d2b307acd2309164edcd)
  
  作成２
  [![Image from Gyazo](https://i.gyazo.com/5b27dc639f37c3fc3d929e422918d104.gif)](https://gyazo.com/5b27dc639f37c3fc3d929e422918d104)
  
  編集１
  [![Image from Gyazo](https://i.gyazo.com/17ad4023b299bf5ef5f52b98eb5bb792.gif)](https://gyazo.com/17ad4023b299bf5ef5f52b98eb5bb792)
  
  編集２
  [![Image from Gyazo](https://i.gyazo.com/727a2cb6fbb4111660c0914bdbd5eff7.gif)](https://gyazo.com/727a2cb6fbb4111660c0914bdbd5eff7)
  
  削除
  [![Image from Gyazo](https://i.gyazo.com/42c13084306faa95c5835fa03c6a1e02.gif)](https://gyazo.com/42c13084306faa95c5835fa03c6a1e02)
  

- **お手伝い記録登録（2ステップ）**  
  お手伝いと子どもを選択し、「登録」ボタンで即記録
  [![Image from Gyazo](https://i.gyazo.com/29946321c13ef45c3a3f02d06ec5e68f.gif)](https://gyazo.com/29946321c13ef45c3a3f02d06ec5e68f)
  
- **ごほうびポイント自動加算**  
  記録時にテンプレートに応じて子どもにポイントが自動加算
  [![Image from Gyazo](https://i.gyazo.com/870153b02c12fff239ed9f2f6f2d37af.gif)](https://gyazo.com/870153b02c12fff239ed9f2f6f2d37af)
  
- **進捗の可視化**  
  子どもごとの日別・週別・月別のお手伝い履歴やポイントを一覧で確認可能。
  日別・週別・月別の表示
  ![日別・週別・月別の表示](https://gyazo.com/58648cb59e7559a2a2384eb17790cc41)
  子別の表示
  ![子別の表示](https://gyazo.com/79c66429c964fdfd57fb99c1fa2a847b)

- **思い出写真登録・閲覧**  
  お手伝いに関連して写真を登録
  [![Image from Gyazo](https://i.gyazo.com/a9b193a54df4ddf899f8fdffd6238576.gif)](https://gyazo.com/a9b193a54df4ddf899f8fdffd6238576)
  アルバム形式で閲覧
  [![Image from Gyazo](https://i.gyazo.com/5bade4303591c0be6902dfb99ff2895c.gif)](https://gyazo.com/5bade4303591c0be6902dfb99ff2895c)


---

## 今後実装予定の機能

- お手伝い達成率のグラフ表示（React Chart導入予定）
- 回数でのごほうび管理
- 思い出に親からのコメント機能  

---


## 開発環境

- 言語：Ruby 3.2.2 / JavaScript
- フレームワーク：Ruby on Rails 7.1.2
- DB：PostgreSQL
- ホスティング：Render
- バージョン管理：Git / GitHub
- その他：ActiveStorage, Devise, Bootstrap（or CSS）

---

## アプリURL
https://tetsumemo.onrender.com

Basic認証 ID： admin 
 Basic認証 パスワード：0602

---

## ローカルでの動作方法

```bash
$ git clone https://github.com/your-username/tasuki.git
$ cd tetumemo
$ bundle install
$ rails db:create db:migrate
$ rails s