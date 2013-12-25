class FbUser < ActiveRecord::Base
	attr_accessible fbid, photo_link
end