Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :concerts do
    resources :setlists
  end
  resources :songs
  resources :artists do
    member do
      delete 'destroylink'
    end
  end
  resources :concert_songs
  root 'welcome#index'
end
