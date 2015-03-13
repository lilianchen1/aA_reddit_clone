Rails.application.routes.draw do
  resources :users
  resource :session
  resources :subs do
    # provides a route to get all the articles for a given magazine.
    resources :posts, only: [:create, :index]
  end
  resources :posts, except: [:new, :create, :index] do
    resources :comments, only: [:new, :create]
  end

  resources :comments, except: [:new]
end
