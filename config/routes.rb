Rails.application.routes.draw do
  root 'newsletter_mailchimp#new_product'

  get '/newsletter/volusion/new_product', to: 'newsletter_volusion#new_product', as: 'newsletter_volusion_new_product'
  post '/newsletter/volusion/new_product', to: 'newsletter_volusion#new_product_build', as: 'newsletter_volusion_new_product_build'

  get '/newsletter/mailchimp/new_product', to: 'newsletter_mailchimp#new_product', as: 'newsletter_mailchimp_new_product'
  post '/newsletter/mailchimp/new_product', to: 'newsletter_mailchimp#new_product_build', as: 'newsletter_mailchimp_new_product_build'
end
