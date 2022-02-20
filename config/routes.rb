Rails.application.routes.draw do
  devise_for :users

  resources :questionnaires do
    resources :questions do
      resources :answers
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
