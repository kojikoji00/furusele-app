Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  resource :select, only: %i[show index new create edit destroy]
  resource :deduction_list, only: %i[show]
end
