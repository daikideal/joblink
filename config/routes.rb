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
  end

  scope module: :job_offerers do
    resources :job_offerers, only: %i[index show], controller: :profiles do
      resource :profile, except: %i[show destroy]
    end
    resources :job_postings
  end

  devise_for :job_seekers, controllers: {
    sessions: 'job_seekers/sessions',
    passwords: 'job_seekers/passwords',
    registrations: 'job_seekers/registrations',
    confirmations: 'job_seekers/confirmations'
  }

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
