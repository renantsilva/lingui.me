Rails.application.routes.draw do
  root 'welcome#index'
  get 'ask', to: 'ask#index'
  get 'user', to: 'user#index'
  get 'teach', to: 'teach#index'
  get 'learn', to: 'learn#index'

  # Para testes:
  resources :mother_languages
  resources :author_comment_posts
  resources :bookmarks
  resources :comments
  resources :posts
  resources :learning_languages
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
