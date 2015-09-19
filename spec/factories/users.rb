FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@website.com" }
    password "password"
    password_confirmation { |u| u.password }
    verified_at { Time.now }
    address "111 E Bay St., OKC, OK 73120"
    senator "Steve Buscemi"
    representative "Some Person"
    house_district "5"
    senate_district "10"
    state "OK"
  end
end
