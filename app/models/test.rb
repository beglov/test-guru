class Test < ApplicationRecord
  belongs_to :category

  def self.titles(category_title)
    category = Category.find_by(title: category_title)
    Test.where(category_id: category.id).order(title: :desc).pluck(:title)
  end
end
