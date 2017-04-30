Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :concerts do
    resources :setlists
    member do
      patch 'manageartist'
    end
  end

  resources :songs

  resources :artists do
    resources :bands
    member do
      patch 'managesong'
      delete 'destroylink'
    end

  end

  resources :concert_songs
  root 'welcome#index'
end
