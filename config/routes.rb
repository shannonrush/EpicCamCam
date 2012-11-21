Epiccamcam::Application.routes.draw do
  resources :sessions
  resources :users do
    resources :devices, :only => :index
  end
  resources :devices do
    resources :feeds, :only => :index
  end
  post 'devices/:device_id/request_feed' => 'feeds#request_feed'

  resources :feeds
end
