class DevicesController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index
    devices = User.find(params[:user_id]).devices
    render :json => devices.to_json
  end
  
  def create
    device = Device.create(params[:device])
    if device
      render :json => device.to_json
    else
      render :json => device.errors.to_json
    end
  end

end
