# professional-careのER図

## admin_users テーブル

| Colum              | Type      | Option                            |
|--------------------|-----------|-----------------------------------|
| email              |string     |null: false , unique: true         |
| encrypted_password |string     |null: false                        |
| name               |string     |null: false                        |
| name_reading       |string     |null: false                        |

### Association

- has_one :user_category


## users テーブル

| Colum                  | Type      | Option                       |
|------------------------|-----------|------------------------------|
| email                  |string     |null: false , unique: true    |
| encrypted_password     |string     |null: false                   |
| childcare_worker_number|string     |null: false                   |
| childcare_worker_id    |integer    |null: false                   |
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

- has_many :lectures
- has_one :user_category


## user_categories


| Colum                | Type      | Option                       |
|----------------------|-----------|------------------------------|
| employment           |data       |null: false , unique: true    |
| affiliation          |string     |null: false                   |
| rank_id              |integer    |null: false                   |
| complet_id           |integer    |null: false                   |
| user                 |references |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :admin_user, class_name: "AdminUser"


## lectures

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| field_id           |integer    |null: false                   |
| lecture_name       |string     |null: false                   |
| lecture_day        |data       |null: false                   |
| lecture_time       |string     |null: false                   |
| building           |string     |                              |
| instructor_name    |string     |null: false                   |
| user               |references |null: false, foreign_key: true|

### Association

- belongs_to :user
