class User < ActiveRecord::Base
  has_secure_password

  has_many :devices

  validates_presence_of :email
  validates_uniqueness_of :email
  
  attr_accessible :email, :password, :password_confirmation
      
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

end
