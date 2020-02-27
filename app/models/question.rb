class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_count_answers

  private

  def validate_count_answers
    errors.add(:answers, 'У одного Вопроса может быть от 1-го до 4-х ответов') if answers.size > 4
  end
end
