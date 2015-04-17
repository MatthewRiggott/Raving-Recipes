require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:name) {|n| "user#{n}" }
    password 'password'
    password_confirmation 'password'
  end

  factory :recipe do
    name "Pad Thai"
    category "Thai"
    description "This is thai food"
    prep_time 20
    country "USA"
    image_url "this is a picture"
  end

  factory :recipe_ingredients do
    recipe
    name "Noodles"
    unit "cup"
    numerator_amount 2
    denominator_amount 3
  end

  factory :directions do
    sequence(:step_number) {|n| n}
    body "This is what we do next"
    recipe
  end

end
