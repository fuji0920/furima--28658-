Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
<<<<<<< HEAD
<<<<<<< HEAD
=======
    resources :orders
>>>>>>> parent of f2c3718... revert orderコントローラー作成
=======
    resources :orders
=======
>>>>>>> parent of 9b37c7a... orderコントローラー作成
>>>>>>> parent of 0867277... revert order controller create action編集
end
