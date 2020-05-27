FactoryBot.define do
  factory :event do
    name { 'Birthday' }
    description { 'A nice party' }
    date { '2020-05-28' }
    location { 'paris' }
  end
end