Rails.application.routes.draw do
  resources :videos, only: [:index, :create]
  root :to => redirect('/videos')
end
