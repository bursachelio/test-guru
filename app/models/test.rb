class Test < ApplicationRecord
  belongs_to :category 
  belongs_to :author, class_name: "User"
  
  has_many :questions 
  has_many :results 
  has_many :users, through: :results

  def self.sorted_test_names_by_category(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
