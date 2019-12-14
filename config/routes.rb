Rails.application.routes.draw do
  root 'home#home'

  devise_for :job_offerers, controllers: {
    sessions: 'job_offerers/sessions',
    passwords: 'job_offerers/passwords',
    registrations: 'job_offerers/registrations'
  }

  scope module: :job_offerers do
    resources :job_offerers, only: %i[index show], controller: :profiles do
      resource :profile, except: %i[show destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
