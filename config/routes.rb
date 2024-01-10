Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :results, only: %i[show update] do
    get :result, on: :member
  end

  get :signup, to: 'users#new'
  resources :users, only: :create

  get :login, to: 'sessions#new'
  resources :sessions, only: :create

  get '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new', as: 'register'
end
