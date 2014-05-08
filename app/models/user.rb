require 'bcrypt'

class User < ActiveRecord::Base
#http://www.therailsway.com/2009/8/3/users-and-passwords/  
  attr_accessor :new_password, :new_password_confirmation
   attr_accessible :email, :encrypted_password, :first_name, :last_name, :currently_employed, 
  :boss_privileges, :currently_employed, :salt, :new_password, :new_password_confirmation

  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates_presence_of :last_name

  validates_uniqueness_of :email
  
  #This validation runs only when the new_password field is not nil and not empty.
  validates_confirmation_of :new_password, :if => :password_changed?

  before_save :hash_new_password, :if=>:password_changed?

   def password_changed?
      !@new_password.blank?
    end


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

  # As is the 'standard' with rails apps we'll return the user record if the
    # password is correct and nil if it isn't.
    def self.authenticate(email, password)
      # Because we use bcrypt we can't do this query in one part, first
      # we need to fetch the potential user
      if user = find_by_email(email)
        # Then compare the provided password against the hashed one in the db.
        if BCrypt::Password.new(user.encrypted_password).is_password? password
          # If they match we return the user 
          return user
        end
      end
      # If we get here it means either there's no user with that email, or the wrong
      # password was provided.  But we don't want to let an attacker know which. 
      return nil
    end

    # This is where the real work is done, store the BCrypt has in the
    # database
    def hash_new_password
      self.encrypted_password = BCrypt::Password.create(@new_password)
    end
end
