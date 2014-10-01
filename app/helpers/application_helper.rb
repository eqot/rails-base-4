module ApplicationHelper

  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new
      @markdown = Redcarpet::Markdown.new(renderer)
    end

    @markdown.render(text).html_safe
  end

  def markdown_to_text(text)
    html = markdown(text)
    Nokogiri::HTML(html).text
  end

end
