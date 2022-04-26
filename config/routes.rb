Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  root :to => 'homes#top'
  get 'confirm_notice' => 'homes#confirm_notice', as: 'confirm_notice'
  scope module: :public do
    get 'unsubscribe/:id' => 'end_users#unsubscribe', as: 'confirm_unsubscribe'
    patch ':id/withdraw/:id' => 'end_users#withdraw', as: 'withdraw_end_user'
    get 'rooms/solution' => 'rooms#resolution'
    get 'bookmarks' => 'bookmarks#index', as: 'bookmarks'
    resources :end_users, only: [:show, :edit, :update] do
      resource :reviews, only: [:new, :create]
      get :reviewers, on: :member
      resource :notices, only: [:new, :create]
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
    end
    resources :rooms, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :chats, only: [:create, :destroy] do
      end
      resource :bookmarks, only: [:create, :destroy]
    end
    resources :categories, only: [:show]
    resources :notifications, only: [:index, :destroy]
  end

  namespace :admin do
    get 'notices/category' => 'notices#category', as: 'notice_categories'
    resources :end_users, only: [:index, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :rooms, only: [:index, :show, :destroy]
    resources :chats, only: [:destroy]
    resources :notices, only: [:index, :show, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
