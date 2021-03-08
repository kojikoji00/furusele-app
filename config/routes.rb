Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'tops#index'
  get 'usage' => 'tops#usage', as: 'usage'
  get 'privacy' => 'tops#privacy', as: 'privacy'
  get 'term' => 'tops#term', as: 'term'
  get 'form' => 'tops#form', as: 'form'
  get 'improve' => 'tops#improve', as: 'improve'
  # post 'tops/guest_sign_in', to: 'tops#new_guest'
  resource :tops, only: %i[show ]
  resource :deduction_list, only: %i[new create]
  resources :categories, only: %i[new create show] do
    resources :category_details, only: %i[new create show]
  end
  resources :histories, only: %i[index new show create] do
    resources :history_details, only: %i[index]
  end
  resources :users, only: %i[new show create edit update]
end
