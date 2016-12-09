Rails.application.routes.draw do
  get 'welcome/index'

  root 'lists#index'

  resources :lists do
  	resources :simple_tasks, :temporal_tasks, :long_tasks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
