Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles

  get 'investors/signup', to: 'investors#new'
  resources :investors, except: [:new]

  get 'startups/signup', to: 'startups#new'
  resources :startups, except: [:new]
end
