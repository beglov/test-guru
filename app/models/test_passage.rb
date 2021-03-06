class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :test_passage_badges, dependent: :delete_all
  has_many :badges, through: :test_passage_badges

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  validate :validate_timer, on: :update, if: :timer?

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

  def timer?
    test.timer.positive?
  end

  def timer_in_seconds
    test.timer * 60
  end

  def duration_in_seconds
    Time.zone.now - created_at
  end

  def seconds_left
    timer_in_seconds - duration_in_seconds
  end

  private

  def validate_timer
    errors.add(:timer, I18n.t('timer')) if seconds_left.negative?
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_update_set_next_question
    self.current_question = next_question
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
