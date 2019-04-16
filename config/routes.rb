Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/dashboard', to: 'welcome#dashboard', as: 'dashboard'

  devise_for :users

  resource :bmi_calculations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
