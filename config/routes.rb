Rails.application.routes.draw do
  devise_for :users
  # get 'consultations/show'
  # get 'consultations/edit'
  # get 'patients/index'
  # get 'patients/show'
  # get 'patients/edit'
  # get 'patients/new'
  # get 'docters/show'
  # get 'docters/dashboard'
  # get 'docters/update'
  root to: "users#dashboard"
  get "home", to: "pages#home"
  get "dashboard", to: "users#dashboard", as: 'dashboard'
  get "medicalrecord", to: "patients#medicalrecord", as: 'medicalrecord'
  get "treatments", to: "patients#treatments", as: 'treatments'
  get "insurance", to: "patients#insurance", as: 'insurance'
  # get "patients/:id/consultations/new", to: "consultations#new", as: "new_consultation"
  # post "patients/:id/consultations", to: "consultations#create", as: "patient_consultations"
  # get "consultations/:id/emails/new", to: "emails#new"
  # post "consultations/:id/emails", to: "email#create"
  # get "patients/:id", to: "patients#show", as: 'profile'
  # get "consultations/:id/emails", to: "emails#index"
  # get "emails/:id", to: "emails/:id#show"
  # get "patients/new", to: "patients#new"
  # get "patients/:id/edit", to: "patients#edit"
  # patch "/patients/:id", to: "patients#update"

  resources :consultations, only: [:create, :index, :show, :new]
  resources :patients, only: [:create, :new, :edit, :update, :show, :index] do
    resources :consultations, only: [:edit, :update]
    resources :emails, only: [:show]
  end

  resources :consultations, only: [:new, :create] do
    patch :add_tags, on: :member
    post "remove_tags", to:"consultations#remove_tags", as: "remove_tags", on: :member
  end

  # resources :patients, only: [:show] do
    resources :consultations, only: [:show, :index] do
      resources :emails, only: [:new, :create, :index]
    end
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

