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

## 実装機能と特徴（Gyazo画像を貼ってください）

- **ユーザー認証機能（Devise）**  
  ログイン・新規登録により、親が個別に子の管理が可能。

- **子どもアカウントの登録・編集・削除**  
  親が複数人の子どもを登録でき、個別に記録を管理可能。
  新規登録１
  https://gyazo.com/2512695be454d80963a154430d98fc63

  新規登録２
  https://gyazo.com/fe2cd2cc9ee9ee00393e8c0bed82373e
  
  編集
  https://gyazo.com/50ede2b4ae1ec5bce024e56823398fe9
  
  削除
  https://gyazo.com/a927f6c48b97efda69f464643817c33b

- **お手伝いテンプレートの作成・編集・削除**  
  親がよくあるお手伝いをテンプレートとして保存し、再利用可能。
  新規作成１
  https://gyazo.com/a275a188048f07ee8870b60467e7121a

  作成２
  https://gyazo.com/8a33ee84315770bf589c7c35b3435aad

  編集１
  https://gyazo.com/8ef39583f61ba1594bcce08099416e7f

  編集２
  https://gyazo.com/5e5cd287a806cfc7e571a939f0670e6d

  編集３
  https://gyazo.com/18562368545aaf4b3116c365132b9d8c
  
  削除
  https://gyazo.com/0141f0972e2278dba9aaf574af478cf8


- **お手伝い記録登録（2ステップ）**  
  お手伝いと子どもを選択し、「登録」ボタンで即記録。
  https://gyazo.com/7534eba9635ab887261c6599716081a8

- **ごほうびポイント自動加算**  
  記録時にテンプレートに応じて子どもにポイントが自動加算。
  https://gyazo.com/09c670410a11ccce619e49de37cca0e6  

- **進捗の可視化**  
  子どもごとの日別・週別・月別のお手伝い履歴やポイントを一覧で確認可能。

- **思い出写真登録・閲覧**  
  お手伝いに関連して写真を登録・アルバム形式で閲覧。
  https://gyazo.com/a9b193a54df4ddf899f8fdffd6238576


---

## 今後実装予定の機能

- お手伝い達成率のグラフ表示（React Chart導入予定）
  

---

## 画面遷移図

![画面遷移図](https://gyazo.com/xxxxxxx)  
※Figmaやdraw.ioなどで作成した画像URLを貼ってください。

---

## 開発環境

- 言語：Ruby 3.2.2 / JavaScript
- フレームワーク：Ruby on Rails 7.1.2
- DB：PostgreSQL
- ホスティング：Render
- バージョン管理：Git / GitHub
- その他：ActiveStorage, Devise, Bootstrap（or CSS）

---

## ローカルでの動作方法

```bash
$ git clone https://github.com/your-username/tasuki.git
$ cd tetumemo
$ bundle install
$ rails db:create db:migrate
$ rails s