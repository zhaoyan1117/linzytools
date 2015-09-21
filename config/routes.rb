Rails.application.routes.draw do
  root 'newsletter_volusion#new_product'

  get '/newsletter/volusion/new_product', to: 'newsletter_volusion#new_product', as: 'newsletter_volusion_new_product'
  post '/newsletter/volusion/new_product', to: 'newsletter_volusion#new_product_build', as: 'newsletter_volusion_new_product_build'
end
