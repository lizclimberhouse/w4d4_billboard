Rails.application.routes.draw do
  root 'billboards#index'
  put "/billboard_songs", to: "billboards#billboard_songs", as: :billboard_songs
  resources :billboards

  resources :artists do
    resources :songs
  end

end
