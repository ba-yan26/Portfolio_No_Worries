Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root :to => 'homes#top'


  scope module: :public do
    get 'rooms/resolution' => 'rooms#resolution', as: 'resolution'
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :rooms, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :chats, only: [:create]
    resources :bookmarks, only: [:create, :destroy]
    resources :notices, only: [:new, :create]
  end

  namespace :admin do
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :rooms, only: [:index, :show, :destroy]
    resources :chats, only: [:destroy]
    resources :notices, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
