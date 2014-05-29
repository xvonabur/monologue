Monologue::Engine.routes.draw do
  root to:  "posts#index"
  get "/page/:page", to:  "posts#index", as:  "posts_page"
  get "/feed" => "posts#feed", as:  "feed", defaults: {format: :rss}

  get "/tags/:tag" =>"tags#show", as: "tags_page"
  get "/news" => "tags#news", as: "news_page"
  get "/articles" => "tags#articles", as: "articles_page"
  get "/events" => "tags#events", as: "events_page"

  namespace :admin, path: "monologue" do
    get "/" => "posts#index", as:  "" # responds to admin_url and admin_path
    get "logout" => "sessions#destroy"
    get "login" => "sessions#new"
    resources :sessions
    resources :posts
    resources :users
    get "comments" => "comments#show", as: "comments"

    match "/post/preview"=>"posts#preview", :as=>"post_preview", :via => [:put, :post]
  end

  get "*post_url" => "posts#show", as:  "post"
end
