class User < ActiveRecord::Base
  #http://edgeguides.rubyonrails.org/active_record_validations.html

  # first handle the user name too short
  # and handle user name must be unique in 2.11 uniqueness
  #validates :username, presence: true, uniqueness: true , length: {minimum: 3, maximum:25 }

  #add to handle the case_sensitive Joe , and joe should be seem the same one.same
  validates :username, presence: true,
            uniqueness: {case_sensitive: false} ,
            length: {minimum: 3, maximum:25 }

  #regular expression
  #http://rubular.com/
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: { case_sensitive: false} ,
            length: { maximum:105 },
            format: { with: VALID_EMAIL_REGEX }
end