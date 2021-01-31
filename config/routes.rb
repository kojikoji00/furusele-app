Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  resource :deduction_list, only: %i[show]
  resources :histories, only: %i[new show create] do
    resources :histroy_details, only: %i[show]
  end
  resources :users, only: %i[new show create edit update]
end
