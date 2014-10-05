module ApplicationHelper

  def markdown(text)
    Downr::Markdown.render(text).html_safe
  end

  def markdown_to_text(text)
    html = markdown(text)
    Nokogiri::HTML(html).text
  end

end
