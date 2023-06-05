Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/posts", to: "posts#ask_index"
  get "/posts", to: "posts#share_index"

end
