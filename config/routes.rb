Rails.application.routes.draw do
  resources :schools
  resources :classrooms

  root 'schools#index'
end
