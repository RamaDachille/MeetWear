Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/ask-feed", to: "posts#ask_index"
  get "/share-feed", to: "posts#share_index"
  get "/profile/:id", to: "pages#profile"

  resources :posts, except: [:index]
  resources :followers, only: %i[index create destroy update]
  resources :followed, only: %i[index create destroy update]

  resources :posts, only: %i[create index new show] do
    resources :feedbacks, only: %i[create index new show]
    resources :comments, only: %i[index show create new]
    resources :saved_posts, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
end

# 1. Create
# 2. Index
# 3. New
# 4. Show
# 5. Edit
# 6. Update
# 7. Delete
