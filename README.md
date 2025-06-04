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

- belongs_to :child
- belongs_to :task_template
- has_one_attached :image（ActiveStorage） 
