class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def url
    "https://gist.github.com/#{github_id}"
  end
end
