class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count_answers, on: :create

  private

  def validate_count_answers
    errors.add(:base, 'У одного вопроса может быть не больше 4-х ответов') if question.answers.size >= 4
  end
end
