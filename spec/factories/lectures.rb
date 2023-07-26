FactoryBot.define do
  factory :lecture do
    lecture_day     { Faker::Date.between(from: 2.days.ago, to: 2.days.from_now) }
    lecture_time    {"90"}
    lecture_name    {"令和5年度　第30回　全日本私立幼稚園連合会　東北地区私立幼稚園設置者・園長研修会（八戸大会）"}
    instructor_name {"田中真紀子"}
    field_id        {2}
    association :user, factory: :user
  end
end