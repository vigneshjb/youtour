class User < ActiveRecord::Base
  attr_accessible :crypted_password, :fbid, :name, :password_salt, :persistance_token, :twid, :username
end
