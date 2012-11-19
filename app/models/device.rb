class Device < ActiveRecord::Base

  belongs_to :user
  validates_presence_of :name, :user_id, :gcm_id
  
  attr_accessible :name, :requested, :user_id, :gcm_id
end
