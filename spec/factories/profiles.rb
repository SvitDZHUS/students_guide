# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone }
    birthday { Faker::Date.between(from: '1990-09-23', to: '2010-09-25') }
  end

  trait :owned_by do
    owned_by { create(:user) }
  end

  trait :invalid_profile do
    first_name { Faker::Lorem.characters(number: 2) }
  end
end
