AnimeErikkatCom::Application.routes.draw do
  resources :subscriptions, :only => [:index, :new, :create, :destroy]

  mount DjMon::Engine => 'dj_mon'

  resources :anime_shows do
    resource :update_show, :only => [:update]
  end

  resource :home_page
  resources :confirm_users, :only => [:index, :update]

  devise_for :users

  resources :episodes do
    resources :user_seen_episodes, :only => [:create]
    resource :download_episode, :only => [:create, :destroy]
  end

  root :to => 'home_page#homepage', :id => 'homepage'
end
