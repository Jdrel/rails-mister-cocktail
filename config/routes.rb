Rails.application.routes.draw do
  get 'cocktails/new', to: 'cocktails#new'
  get 'cocktails', to: 'cocktails#index'
  get 'cocktails/:id', to: 'cocktails#show', as: :cocktail
  post 'cocktails', to: 'cocktails#create'

  get 'doses/new', to: 'doses#new'
  post 'doses', to: 'doses#create'
  delete 'doses/:id', to: 'doses#destroy', as: :dose

  root to: 'cocktails#index'
end
