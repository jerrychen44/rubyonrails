class Article < ActiveRecord::Base

  #for the view of article, it can belongs to many users.
  belongs_to :user

  #for add the many to many to article_categories table ++
  has_many :article_categories
  has_many :categories, through: :article_categories
  #--

  validates :title, presence: true, length:{minimum:3, maximum: 50}
  validates :description, presence: true, length:{minimum:10, maximum: 300}
end
