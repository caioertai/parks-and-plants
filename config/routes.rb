Rails.application.routes.draw do
  get 'taggings/new'
  resources :gardens, only: [:index, :show] do
    resources :plants, only: [:new, :create]
  end

  resources :plants, only: :destroy do
    resources :taggings, only: [:new, :create]
  end
end
