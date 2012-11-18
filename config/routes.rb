Epiccamcam::Application.routes.draw do
  resources :sessions
  resources :users do
    resources :devices, :only => :index
  end
  resources :devices
  resources :feeds
end
