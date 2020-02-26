class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def user_tests(level = 0)
    tests.where(level: level)
  end
end
