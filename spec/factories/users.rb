FactoryBot.define do
  factory :user do
    email                   {Faker::Internet.free_email}
    password                {'abc123'}
    password_confirmation   {password}
    worker_prefecture_id    {2}
    childcare_worker_number {"0222222"}
    first_name             {"田中"}
    last_name              {"裕二"}
    first_name_reading     {"たなか"}
    last_name_reading      {"ゆうじ"}
    birth_date             {Faker::Date.birthday}
    postcode                {"123-4567"}
    prefecture_id           {2}
    city                    {"東京都"}
    block                   {"1-1"}
    building                {"ビル"}
  end
end
