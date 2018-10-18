Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :posts, except: [:index] do
    member do
      get :toggle_status
    end
  end
  get 'blog', to: 'posts#index'

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
  get '*path', to: redirect('/')
end
