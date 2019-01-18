Rails.application.routes.draw do
  resources :issues do
    resources :todos, only: %w[create destroy]
  end

  root 'issues#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
