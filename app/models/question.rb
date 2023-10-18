class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_number_of_answers

  private

  def validate_number_of_answers
    unless (1..4).cover?(answers.count)
      errors.add(:base, "A question must have between 1 and 4 answers")
    end
  end
end
