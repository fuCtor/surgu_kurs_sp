SurguKursSp::Application.routes.draw do
  get "welcome/index"

  devise_for :users

  root to: 'welcome#index'

  namespace :manual do
    root to: 'subjects#index'
    resources :subjects do
      resources :laboratories
    end
  end

end
