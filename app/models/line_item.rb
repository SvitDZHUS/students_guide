class LineItem < ApplicationRecord
  belongs_to :lineable, polymorphic: true
  belongs_to :book
end
