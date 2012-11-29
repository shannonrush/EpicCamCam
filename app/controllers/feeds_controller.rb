class FeedsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def request_feed
    device = Device.find(params[:device_id])
    device.update_attribute(:requested,true)
    gcm_message_status = device.request_feed
    puts gcm_message_status
    render :json => {"gcm_message_status" => gcm_message_status}
  end

  def index
    device = Device.find(params[:device_id])
    if device.feeds.empty?
      render :json => {"status" => "unavailable"}
    else
      render :json => {"status" => "available", "video_url" => device.feeds.last.stream.url}
    end
  end

  def create 
    feed = Feed.create(params[:feed])
    if feed
      render :json => feed.to_json
    else
      render :json => feed.errors.to_json
    end 
  end
end
