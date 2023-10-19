class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_of_answers_per_question, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_answers_per_question
    if question.answers.count >= 4
      errors.add(:base, "A question can have at most 4 answers")
    end
  end
end
