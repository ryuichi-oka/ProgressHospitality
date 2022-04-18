Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => "homes#about", as: "about"

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :groups, only: [:new, :create, :index, :show, :edit, :update]

    resources :members, only: [:new, :create, :show, :edit, :update]

    resources :manuals, only: [:new, :create, :index, :show, :edit, :update]

    resources :work_types, only: [:new, :create, :index, :edit, :update]
  end

  devise_for :members, skip: [:passwords], controllers: {
    registrations: "member/registrations",
    sessions: "member/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
