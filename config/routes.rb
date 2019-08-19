Rails.application.routes.draw do
  resources :posts do
    resources :comments, except: :index
  end
  root 'posts#index'
end
