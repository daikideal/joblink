Rails.application.routes.draw do
  devise_for :job_offerers, controllers: {
    sessions: 'job_offerers/sessions',
    passwords: 'job_offerers/passwords',
    registrations: 'job_offerers/registrations'
  }
  root 'home#home'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
