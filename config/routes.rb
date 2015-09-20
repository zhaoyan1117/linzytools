Rails.application.routes.draw do
  root 'welcome#index'

  get '/newsletter/volusion', to: 'newsletter_volusion#index', as: 'newslettervolusion'
end
