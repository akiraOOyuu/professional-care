FactoryBot.define do
  factory :user_category do
      employment      { Faker::Date.between(from: 2.days.ago, to: 2.days.from_now) }
      affiliation    {"たちばな保育園"}
      rank_id        {2}
      complete_id    {2}
      association :user, factory: :user
  end
end
