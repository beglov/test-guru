class User < ApplicationRecord
  def tests(level = 0)
    Test.where(user_id: id, level: level)
  end
end
