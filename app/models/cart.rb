# frozen_string_literal: true

class Cart < ApplicationRecord
  include OwnedBy
  has_many :line_items
  has_one :order

  def total_price
    line_items.to_a.sum(&:price)
  end
end
