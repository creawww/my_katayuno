Rails.application.routes.draw do
  root to: 'katas#index'

  get '/katas/:id' => 'katas#show' , as: :kata
  get 'new/katas' => 'katas#new' , as: :new_kata
  get 'edit/katas/:id' => 'katas#edit' , as: :edit_kata
  post 'create/katas' => 'katas#create', as: :create_katas
  patch '/katas/:id' => 'katas#update' , as: :update_kata
  delete '/katas/:id' => 'katas#delete' , as: :delete_kata  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
