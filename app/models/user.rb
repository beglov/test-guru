class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :gists, dependent: :nullify
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages
  has_many :test_passage_badges, through: :test_passages
  has_many :badges, through: :test_passage_badges
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :email, presence: true,
                    format: {with: /\w+@\w+\.\w+/},
                    uniqueness: true

  def user_tests(level = 0)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def passed_tests?(test_ids)
    passed_test_ids = test_passages.where(test_id: test_ids).select(&:success?).map(&:test_id)
    test_ids.uniq.sort == passed_test_ids.uniq.sort
  end
end
