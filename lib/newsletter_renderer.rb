class NewsletterRenderer
  NEWSLETTER_TEMPLATE_DIR = Rails.root.join('lib/assets/newsletter_templates/')

  def initialize(template)
    @template = ERB.new(File.open(NEWSLETTER_TEMPLATE_DIR.join("#{template}.html.erb")).read)
  end

  def render(params)
    @params = params
    @template.result binding
  end
end
