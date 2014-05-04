class User < ActiveRecord::Base

  attr_accessible :email, :encrypted_password, :first_name, :last_name, :currently_employed, 
  :boss_privileges, :currently_employed, :salt

  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates_presence_of :last_name

  validates_uniqueness_of :email

  def initialize(attributes = {}, options = {})
    super # must allow the active record to initialize!
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    self.currently_employed = true
    self.boss_privileges = false
    self.salt = "trkreaDrakeSalt"
  end

  def give_boss_privileges
     self.boss_privileges = true
     self.save
  end
  
  def revoke_boss_privileges
    self.boss_privileges = false
    self.save
  end

  def revoke_employment
    self.currently_employed = false
  end
  #http://www.codeproject.com/Articles/575551/User-Authentication-in-Ruby-on-Rails#AuthenticatingbyUsername31
  def self.authenticate(email, encrypted_password)
    user = find_by_email(email)
    if user && password_hash == BCrypt::Engine.hash_secret(encrypted_password, user.salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
       self.salt = BCrypt::Engine.generate_salt
     end  
   end    
end
