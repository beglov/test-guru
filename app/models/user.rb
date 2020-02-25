class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def user_tests(level = 0)
    tests.where(level: level)
  end
end
