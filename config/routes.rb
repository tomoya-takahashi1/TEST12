Rails.application.routes.draw do
  get 'users/index' #allメソッドはusersテーブルのレコードを全て取得できるメソッド
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
