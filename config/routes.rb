Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
<<<<<<< HEAD
    resources :orders
=======
>>>>>>> parent of 9b37c7a... orderコントローラー作成
end
