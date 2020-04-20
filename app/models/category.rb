class Category < ApplicationRecord
  has_many :tests, dependent: :delete_all

  default_scope { order(title: :asc) }

  validates :title, presence: true
end
