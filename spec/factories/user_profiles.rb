FactoryGirl.define do
  factory :user_profile do
    sequence(:user_id)
    address "111 E Bay St., OKC, OK 73120"
    senator "Steve Buscemi"
    representative "Some Person"
    house_district "5"
    senate_district "10"
    state "OK"
  end
end
