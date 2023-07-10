Rails.application.routes.draw do
  resources :weathers, only: [:index] do
    collection do
      get :weather_info
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'weathers#index'
end
