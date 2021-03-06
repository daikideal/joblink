# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#home'

  devise_for :job_offerers, controllers: {
    sessions: 'job_offerers/sessions',
    passwords: 'job_offerers/passwords',
    registrations: 'job_offerers/registrations',
    confirmations: 'job_offerers/confirmations'
  }

  devise_scope :job_offerer do
    get 'confirm_email', to: 'job_offerers/registrations#confirm_email'
    post 'job_offerers/guest_sign_in', to: 'job_offerers/sessions#guest'
  end

  scope module: :job_offerers do
    resources :job_offerers, only: %i[index show destroy], controller: :profiles do
      resource :profile, except: %i[show destroy]
    end
  end

  devise_for :job_seekers, controllers: {
    sessions: 'job_seekers/sessions',
    passwords: 'job_seekers/passwords',
    registrations: 'job_seekers/registrations',
    confirmations: 'job_seekers/confirmations'
  }

  devise_scope :job_seeker do
    get 'confirm_email', to: 'job_seekers/registrations#confirm_email'
    post 'job_seekers/guest_sign_in', to: 'job_seekers/sessions#guest'
  end

  scope module: :job_seekers do
    resources :job_seekers, only: %i[index show destroy], controller: :profiles do
      resource :profile, except: %i[show destroy]
      resource :resume, except: %i[index show]
    end
  end

  resources :rooms, only: %i[index show create] do
    resources :entries, only: :destroy
  end

  resources :job_postings do
    resource :bookmark, only: %i[create destroy]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
