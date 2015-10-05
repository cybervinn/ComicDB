class User < ActiveRecord::Base

  validates :fname, presence: true

  before_save {self.email = self.email.downcase } 
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password #Used with Bcrypt

end
