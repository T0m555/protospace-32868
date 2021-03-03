

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :comments
- has_many :prototype

## comments テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| text      | text      | null: false |
| user      | reference | null: false |
| prototype | reference | null: false |

### Association

- belongs_to :user
- belongs_to :prototype

## prototypes テーブル

| Column     | Type           | Options     |
| ---------- | -------------- | ----------- |
| title      | string         | null: false |
| catch_copy | text           | null: false |
| concept    | text           | null: false |
| image      | Active Storage | null: false |
| user       | reference      | null: false |