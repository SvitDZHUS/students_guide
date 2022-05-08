# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    book { create(:book) }
  end

  trait :to_cart do
    lineable { create(:user).cart }
  end

  trait :to_shelf do
    lineable { create(:user).shelf }
  end
end
