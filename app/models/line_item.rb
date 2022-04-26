class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book

  validates :book_id, uniqueness: { scope: %i[book_id cart_id] }
end
