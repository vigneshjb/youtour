class Tour < ActiveRecord::Base
  attr_accessible :desp, :doj, :from_loc, :to_loc, :user_id
  belongs_to :user
  has_many :trips
end
