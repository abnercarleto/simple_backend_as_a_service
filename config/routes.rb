Rails.application.routes.draw do
  namespace :api do
    resources :resources, path: 'resources/:model_slug'
  end
  namespace :definition do
    resources :models
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
