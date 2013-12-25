class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :crypted_password, :fbid, :name, :password_salt, :persistence_token, :twid, :username, 
  				:password, :password_confirmation, :old_password, :id
  has_many :tours
end
