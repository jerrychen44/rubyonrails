class Article < ActiveRecord::Base

  #for the view of article, it can belongs to many users.
  belongs_to :user

  validates :title, presence: true, length:{minimum:3, maximum: 50}
  validates :description, presence: true, length:{minimum:10, maximum: 300}
end