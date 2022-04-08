# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'MyString' }
    description { 'MyText' }
    category { 'MyString' }
    price { '9.99' }
    publishing_house { 'MyString' }
    publishing_date { '2022-04-06' }
    cover { 'MyString' }
    language { 'MyString' }
  end
end
