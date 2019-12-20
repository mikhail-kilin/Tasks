Rails.application.routes.draw do

  devise_for :users
  get 'pages/welcome'

  get 'tasks/done' => 'tasks#done'
  get 'tasks/not_done' => 'tasks#not_done'

  resources :tasks do
    patch 'done' => 'tasks#make_done'
    resources :comments, only: [:create]
  end

  root to: "pages#welcome"

end
