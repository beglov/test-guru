class User < ApplicationRecord
  # include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true,
                    format: {with: /\w+@\w+\.\w+/},
                    uniqueness: true

  has_secure_password

  def user_tests(level = 0)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
