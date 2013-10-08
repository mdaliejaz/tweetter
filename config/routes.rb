Twitter::Application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :tweets, :users
    end

end
