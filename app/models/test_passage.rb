class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :test_passage_badges, dependent: :delete_all
  has_many :badges, through: :test_passage_badges

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question
  after_update :after_update_assign_badges, if: %i[completed? success?]

  PERCENT = 85

  def completed?
    current_question.nil?
  end

  def success_percent
    correct_questions.to_f / test.questions.size * 100
  end

  def success?
    success_percent >= PERCENT
  end

  def fail?
    !success?
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def after_update_assign_badges
    Badge.all.each do |badge|
      scope = Test.with_questions

      if badge.category_rule? && test.category_id == 2
        test_ids = scope.where(category_id: 2).pluck(:id)
        badges << badge if user.passed_tests?(test_ids)
      elsif badge.first_attempt_rule?
        badges << badge if TestPassage.where.not(id: id).where(user_id: user_id, test_id: test_id).blank?
      elsif badge.level_rule? && test.level == 1
        test_ids = scope.where(level: 1).pluck(:id)
        badges << badge if user.passed_tests?(test_ids)
      end
    end
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
