Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => "homes#about", as: "about"

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  devise_for :members, skip: [:passwords], controllers: {
    registrations: "member/registrations",
    sessions: "member/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
