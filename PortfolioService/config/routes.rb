Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :posts, except: [:index] do
    member do
      get :toggle_status
    end
  end
  get 'blog', to: 'posts#index'
  
  root to: 'pages#home'
  get '*path', to: redirect('/')
end
