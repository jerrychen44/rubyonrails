class Category < ActiveRecord::Base

  #validates :name, presence: true
  #http://guides.rubyonrails.org/active_record_validations.html#presence
  #*** presence check 1.nil 2.blank string
  validates :name, presence: true, length: { minimum: 3, maximum: 25}

  validates_uniqueness_of :name

end