Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => "homes#about", as: "about"

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :groups, only: [:new, :create, :index, :show, :edit, :update]
    
    resources :group_messages

    resources :members, only: [:new, :create, :show, :edit, :update]

    resources :manuals, only: [:new, :create, :index, :show, :edit, :update]

    resources :work_types, only: [:new, :create, :index, :edit, :update]

    resources :skills, only: [:new, :create, :index, :show, :edit, :update]

    resources :skill_details, only: [:create, :edit, :update, :destroy]

    resources :member_skills, only: [:create, :update, :destroy]

    resources :skill_manuals, only: [:create, :destroy]
  end

  devise_for :members, skip: [:passwords], controllers: {
    registrations: "member/registrations",
    sessions: "member/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
