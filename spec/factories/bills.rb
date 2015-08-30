FactoryGirl.define do
  factory :bill do
    name "HB1001"
    description ["History of HB 1001",
                 "Action",
                 "Journal Page",
                 "Date",
                 "Chamber",
                 "First Reading",
                 "47",
                 "02/02/2015",
                 "H"]
    user
  end

end
