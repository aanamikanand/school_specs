Rails.application.routes.draw do
  

  get 'classrooms/index'

  get 'classrooms/show'

  get 'classrooms/new'

  get 'classrooms/edit'

  resources :schools do
  	resources :classrooms
  end

   root 'schools#index'
end
