class Category < ActiveRecord::Base


  #for add the many to many to article_categories table ++
  has_many :article_categories
  has_many :articles, through: :article_categories
  #--


  #validates :name, presence: true
  #http://guides.rubyonrails.org/active_record_validations.html#presence
  #*** presence check 1.nil 2.blank string
  validates :name, presence: true, length: { minimum: 3, maximum: 25}

  validates_uniqueness_of :name

end
