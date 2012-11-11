Epiccamcam::Application.routes.draw do
  resources :sessions
  resources :users
  resources :devices
  resources :feeds
end
