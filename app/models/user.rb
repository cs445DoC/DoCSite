class User < ActiveRecord::Base
  	    attr_accessible :boss_privelages, :currently_employed, :email, :encrypted_password, :first_name, :last_name
attr_accessor :boss_privelages, :currently_employed, :email, :encrypted_password, :first_name, :last_name

	validates :boss_privelages, presence: true
	validates :currently_employed, presence: true
	validates :email, presence: true
	validates :encrypted_password, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
end
