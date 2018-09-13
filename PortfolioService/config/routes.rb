Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :posts, except: [:index]
  get 'blog', to: 'posts#index'

  root to: 'pages#home'
  get '*path', to: redirect('/')
end
