class Feed < ActiveRecord::Base
  attr_accessible :device_id, :stream
  has_attached_file :stream 
end
