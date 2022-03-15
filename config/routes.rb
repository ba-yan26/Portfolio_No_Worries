Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root :to => 'homes#top'
  get 'unsubscribe/:id' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:id' => 'homes#withdraw', as: 'withdraw_end_user'
  get 'confirm_notice' => 'homes#confirm_notice', as: 'confirm_notice'
  scope module: :public do
    get 'rooms/resolution' => 'rooms#resolution', as: 'resolution'
    get 'bookmarks' => 'bookmarks#index', as: 'bookmarks'
    resources :end_users, only: [:show, :edit, :update] do
      resource :notices, only: [:new, :create]
    end
    resources :rooms, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :chats, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    resources :categories, only: [:show]
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
