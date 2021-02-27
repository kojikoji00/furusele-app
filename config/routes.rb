Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tops#index'
  get 'usage' => 'tops#usage', as: 'usage'
  get 'privacy' => 'tops#privacy', as: 'privacy'
  get 'term' => 'tops#term', as: 'term'
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
