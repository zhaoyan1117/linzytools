class NewsletterVolusionController < ApplicationController
  def new_product
    load_cookies

    if flash[:error]
      @raw_product_codes = flash[:raw_product_codes]
      @raw_product_names = flash[:raw_product_names]
      @new_arrivals_url = flash[:new_arrivals_url]
    end
  end

  # Refactor
  def new_product_build
    @raw_product_codes = params['product_codes']
    @raw_product_names = params['product_names']
    @new_arrivals_url = params['new_arrivals_url']

    save_cookies

    @product_codes = @raw_product_codes.split(/\r?\n/).map { |code| code.strip }
    @product_names = @raw_product_names.split(/\r?\n/).map { |name| name.strip }

    unless @product_codes.size == @product_names.size
      flash[:error] = "Product names and product code have same number of lines."
      flash[:raw_product_codes] = @raw_product_codes
      flash[:raw_product_names] = @raw_product_names
      flash[:new_arrivals_url] = @new_arrivals_url
      redirect_to :back
    end

    @newsletter = NewsletterRenderer.new('new_products_volution')
                                    .render @new_arrivals_url, @product_codes, @product_names
  end

  private

  def load_cookies
    @raw_product_codes = cookies['product_codes'].to_s
    @raw_product_names = cookies['product_names'].to_s
    @new_arrivals_url = cookies['new_arrivals_url'].to_s
  end

  def save_cookies
    cookies['product_codes'] = { value: @raw_product_codes, expires: 8.hour.from_now }
    cookies['product_names'] = { value: @raw_product_names, expires: 8.hour.from_now }
    cookies['new_arrivals_url'] = { value: @new_arrivals_url, expires: 8.hour.from_now }
  end
end
