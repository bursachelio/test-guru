class User < ApplicationRecord
  has_many :tests, foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  
  def tests_at_difficulty_level(level)
    tests.where(level: level)
  end
end
