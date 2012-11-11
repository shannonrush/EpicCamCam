class DevicesController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def create
    device = Device.create(params[:device])
    if device
      render :json => device.to_json
    else
      render :json => device.errors.to_json
    end
  end

end
