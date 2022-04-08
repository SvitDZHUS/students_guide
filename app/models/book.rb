# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader
  has_and_belongs_to_many :categories

  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :price, numericality: { greater_than: 0 }
  validates :language, presence: true
end
