AnimeErikkatCom::Application.routes.draw do
  resources :subscriptions, :only => [:index, :new, :create, :destroy]

  mount DjMon::Engine => 'dj_mon'

  resources :anime_shows
  resource :home_page

  devise_for :users

  resources :episodes do
    resources :user_seen_episodes, :only => [:create]
    resource :download_episode, :only => [:create, :destroy]
  end

  resources :anime_shows

  root :to => 'home_page#homepage', :id => 'homepage'
end
