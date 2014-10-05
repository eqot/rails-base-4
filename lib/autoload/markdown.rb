module Markdown

  def self.to_html(text)
    Downr::Markdown.render(text).html_safe
  end

  def self.to_text(text)
    html = self.to_html(text)
    Nokogiri::HTML(html).text
  end

end
