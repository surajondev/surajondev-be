Rails.application.routes.draw do
  # Nested route for fetching articles by author
  resources :authors do
    resources :articles, only: [:index]
  end

  # Main article routes
  resources :articles

  # Custom route to fetch an article by slug
  get '/articles/slug/:slug', to: 'articles#show_by_slug'
end
