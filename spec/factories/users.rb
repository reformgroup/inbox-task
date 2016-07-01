FactoryGirl.define do
  factory :user do
    last_name "MyString"
    first_name "MyString"
    email "MyString"
    gender 1
    birth_date "2016-06-30"
    password_digest "MyString"
    remember_digest "MyString"
    role 1
    avatar ""
  end
end
