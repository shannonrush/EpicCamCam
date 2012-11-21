class Feed < ActiveRecord::Base

  belongs_to :device

  attr_accessible :device_id, :stream
  has_attached_file :stream 
end
