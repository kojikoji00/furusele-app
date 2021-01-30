Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  resource :select, only: %i[show index new create edit destroy]
  resource :deduction_list, only: %i[show]
  resources :history, only: %i[new show] do
    resources :histroy_detail, only: %i[show]
  end
  resources :users, only: %i[new show create edit update]
end
