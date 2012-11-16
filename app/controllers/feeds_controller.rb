class FeedsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def create 
    feed = Feed.create(params[:feed])
    if feed
      render :json => feed.to_json
    else
      render :json => feed.errors.to_json
    end 
  end
end
