class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  scope :sorted_by_name, -> { order(:title) }
end
