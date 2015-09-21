class NewsletterRenderer
  NEWSLETTER_TEMPLATE_DIR = Rails.root.join('lib/assets/newsletter_templates/')

  def initialize(template)
    @template = ERB.new(File.open(NEWSLETTER_TEMPLATE_DIR.join("#{template}.html.erb")).read)
  end

  # FIX
  def render(new_arrivals_url, product_codes, product_names)
    @new_arrivals_url = new_arrivals_url
    @product_codes = product_codes
    @product_names = product_names

    @template.result binding
  end
end
