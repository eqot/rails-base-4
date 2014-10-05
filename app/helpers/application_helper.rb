require 'markdown'

module ApplicationHelper

  def markdown(text)
    Markdown.to_html(text)
  end

  def markdown_to_text(text)
    Markdown.to_text(text)
  end

end
