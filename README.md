## name
prifessional-care

## image or gif

## Overview
保育士さんのキャリアパスの仕組みを構築し、一定の技能・経験を有する職員への処遇改善を行うことで職場への定着率を図るもの。
こちらを可視化し、簡潔に管理できるようにしたもの。

## Requirement
- widows
- Rails 6.0.6.1
- devise-4.9.2

## Usage
保育士さんのキャリアアップによる名簿管理アプリ

## Features
- userは自身の基本情報や就職日や講義等を入力。
- 就職日から計算し、勤務年数を自動計算。
- 講義を保存し、必修研修時間を可視化。
- 管理者userはuserの一覧表を確認できる。

## Reference

##Licence


# professional-careのER図

## admin_users テーブル

| Colum              | Type      | Option                            |
|--------------------|-----------|-----------------------------------|
| email              |string     |null: false , unique: true         |
| encrypted_password |string     |null: false                        |
| name               |string     |null: false                        |


### Association
- has_many :user
- has_one :user_category, foreign_key: :user_id


## users テーブル

| Colum                  | Type      | Option                       |
|------------------------|-----------|------------------------------|
| email                  |string     |null: false , unique: true    |
| encrypted_password     |string     |null: false                   |
| worker_prefecture_id   |string     |null: false                   |
| childcare_worker_number|string     |null: false                   |
| first_name             |string     |null: false                   |
| last_name              |string     |null: false                   |
| first_name_reading     |string     |null: false                   |
| last_name_reading      |string     |null: false                   |
| birth_date             |date       |null: false                   |
| postcode               |string     |null: false                   |
| prefecture_id          |integer    |null: false                   |
| city                   |string     |null: false                   |
| block                  |string     |null: false                   |
| building               |string     |                              |

### Association

- belongs_to :admin
- has_many :lectures
- has_one :user_category, foreign_key: :user_id


## user_categories


| Colum                | Type      | Option                       |
|----------------------|-----------|------------------------------|
| employment           |date       |null: false , unique: true    |
| affiliation          |string     |null: false                   |
| rank_id              |integer    |null: false                   |
| complete_id          |integer    |null: false                   |
| user                 |references |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :admin


## lectures

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| field_id           |integer    |null: false                   |
| lecture_name       |string     |null: false                   |
| lecture_time       |string     |null: false                   |
| instructor_name    |string     |null: false                   |
| lecture_day        |date       |null: false                   |
| user               |references |null: false, foreign_key: true|

### Association

- belongs_to :user
