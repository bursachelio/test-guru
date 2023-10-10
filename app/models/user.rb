class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :results
  has_many :tests, through: :results
  
  def tests_at_difficulty_level(level)
    Test.joins(:results)
        .where(results: { user_id: id }, level: level)
  end
end
