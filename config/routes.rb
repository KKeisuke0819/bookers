Rails.application.routes.draw do
  resources :books
  root :to => 'welcome#index'
end
