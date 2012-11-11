class Device < ActiveRecord::Base

  belongs_to :user
  
  attr_accessible :name, :requested
end
