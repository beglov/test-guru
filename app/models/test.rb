class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.titles(category_title)
    Test.joins(:category).where('categories.title = ?', category_title).order(title: :desc).pluck(:title)
  end
end
