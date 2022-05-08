# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    category_name { Faker::Book.genre }
  end

  trait :invalid_category do
    category_name { Faker::Lorem.characters(number: 2) }
  end
end
