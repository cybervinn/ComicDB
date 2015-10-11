class User < ActiveRecord::Base

  validates :fname, presence: true

  before_save {self.email = self.email.downcase } 
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  
  #Used with Bcrypt
  has_secure_password 

  #Used with Paperclip
  has_attached_file :avatar, styles: { medium: "300x300>", 
                                       thumb: "100x100>" },
                                       default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end
