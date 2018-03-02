Rails.application.routes.draw do
  root 'accounts#index'
  devise_for :users
  put "/billboard_songs", to: "billboards#billboard_songs", as: :billboard_songs
  resources :billboards
  resources :accounts

  resources :artists do
    resources :songs
  end

end
