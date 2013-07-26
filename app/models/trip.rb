class Trip < ActiveRecord::Base
  attr_accessible :request_by, :status, :tour_id
  belongs_to :tour
end
