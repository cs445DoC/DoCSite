class User < ActiveRecord::Base

  attr_accessor :boss_privileges, :currently_employed, :email,
  :encrypted_password, :first_name, :last_name, :salt, :password_confirmation

  attr_accessible :boss_privileges, :currently_employed, :email,
  :encrypted_password, :first_name, :last_name, :salt, :password_confirmation
 
  before_save :encrypt_password

  validates :boss_privileges, presence: true
  validates :currently_employed, presence: true
  validates_presence_of :email, :on => :create
  validates_presence_of :encrypted_password, :on => :create
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create

  validates_uniqueness_of :email

  def initialize(attributes = {})
    super # must allow the active record to initialize!
  end

  #http://www.codeproject.com/Articles/575551/User-Authentication-in-Ruby-on-Rails#AuthenticatingbyUsername31
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && password_hash == BCrypt::Engine.hash_secret(password, user.salt)
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
