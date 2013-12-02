class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  protected
	def self.find_for_database_authentication(conditions)
		login = conditions.delete(:login)
	  	where(conditions)
	  	.where(["username = :login OR email = :login",
	    	{:login => login}]).first
	end
end