Rails.application.routes.draw do
  devise_for :autors
  get 'estaticas/contacto'

  get 'estaticas/nosotros'

  get 'home/index'
  root "home#index"
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
