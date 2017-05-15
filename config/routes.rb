Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :concerts do
    resources :setlists
    member do
      patch 'manageartist'
      patch 'managevenue'
    end
    collection do
      get 'concertsearch'
      get 'concertfilter'
    end
  end

  resources :songs do
    collection do
      get 'songsearch'
      get 'songfilter'
    end
  end

  resources :artists do
    resources :bands
    member do
      patch 'managesong'
      delete 'destroylink'
    end

  end

  resources :venues
  
  resources :concert_songs
  root 'welcome#index'
end
