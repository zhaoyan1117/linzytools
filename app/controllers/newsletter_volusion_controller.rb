class NewsletterVolusionController < ApplicationController
  def new_product
    load_cookies
  end

  def new_product_build
    @product_codes = params['product_codes']
    @product_names = params['product_names']
    @new_arrivals_url = params['new_arrivals_url']

    save_cookies
  end

  private

  def load_cookies
    @product_codes = cookies['product_codes'].to_s
    @product_names = cookies['product_names'].to_s
    @new_arrivals_url = cookies['new_arrivals_url'].to_s
  end

  def save_cookies
    cookies['product_codes'] = { value: @product_codes, expires: 8.hour.from_now }
    cookies['product_names'] = { value: @product_names, expires: 8.hour.from_now }
    cookies['new_arrivals_url'] = { value: @new_arrivals_url, expires: 8.hour.from_now }
  end
end
