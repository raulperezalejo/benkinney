FactoryGirl.define do

  factory :user do
    first_name "testing"
    last_name  "user"
    email "test@test.com"
    password "test123"
  end

  factory :post do
    title "Testing Post"
    body  "this is the body of the testing post"
    association :user, factory: :user, first_name: "post",
                                        last_name: "testing",
                                        email: "post@testing.com",
                                        password: "test123"
  end


end