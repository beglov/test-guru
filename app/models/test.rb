class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :complex, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true,
                    uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def self.titles(category_title)
    Test.joins(:category).where('categories.title = ?', category_title).order(title: :desc).pluck(:title)
  end
end
