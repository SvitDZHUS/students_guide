# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :categories

  mount_uploader :cover, CoverUploader
  mount_uploader :file, FileUploader

  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :author, presence: true, length: { minimum: 3, maximum: 255 }
  validates :language, presence: true
  validates :cover, presence: true
  validates :file, presence: true
  validates :categories, presence: true

  def self.latest_books(number)
    order(created_at: :desc).limit(number)
  end
end
