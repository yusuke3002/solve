# アプリケーション名
Solve (ソルヴ)

# アプリケーション概要
仕事の依頼者と受注者のマッチングアプリです。

# 利用方法
自分だけでは大変な仕事や手伝って欲しい作業を依頼でき、依頼を受注すると報酬が得られます。仕事の依頼や受注にはユーザー登録が必要となります。依頼の一覧や詳細はログインしなくても閲覧可能です。

# 目指した課題解決
畑の収穫量が多く一人では困難な場合の手助けの依頼や、冬場の雪国における高齢者の屋根の雪下ろしの代行など、体力的、また季節的なものによる作業の手助けといった課題の解決を目指しています。

# 洗い出した要件
### ユーザー管理機能
### 仕事依頼機能
### 依頼一覧表示機能
### 依頼詳細表示機能
### 依頼編集機能
### 依頼削除機能
### 依頼受注機能
### マイページ機能
### コメント機能

# ER図
[![Image from Gyazo](https://i.gyazo.com/fe6b213a321f60aa70fb73efed270636.png)](https://gyazo.com/fe6b213a321f60aa70fb73efed270636)

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| username           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_ruby     | string | null: false               |
| first_name_ruby    | string | null: false               |
| birth              | date   | null: false               |

### Association
- has_many :requests
- has_many :accepts
- has_many :comments

## requests
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| content    | text       | null: false                    |
| area       | string     | null: false                    |
| date       | string     | null: false                    |
| time       | string     | null: false                    |
| reward     | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :accept
- has_many :comments

## accepts
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| request    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :request

## comments
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| request    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :request