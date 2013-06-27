require 'digest/sha1'

class User < ActiveRecord::Base
  # Remember to create a migration!
  # validates :first_name, :last_name, :email, :password, :presence => true
  
  before_create :encrypt_password

  def self.authenticate(password, email)
    user = User.find_by_email(email)
    password = Digest::SHA1.hexdigest("#{password}")
    user.password == password
  end

  def encrypt_password
     # new_password = Digest::SHA1.hexdigest("#{password}")
     # self.password = new_password
     self.password = Digest::SHA1.hexdigest("#{password}")
  end

end



 
