FactoryGirl.define do
  factory :funeral do
    customer
    cat_name "Miki"
    start_time Time.now+1.hour
  end
end
