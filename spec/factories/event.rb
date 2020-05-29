FactoryBot.define do
  factory :event do
    name { Faker::Esport.event }
    description { Faker::Esport.game }
    date { '2020-05-28' }
    location { Faker::Address.city }
  end
end
