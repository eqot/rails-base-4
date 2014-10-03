module Markdown
  class API < Grape::API
    version 'v1', using: :path
    format :txt
    prefix :api

    helpers do
      def markdown(text)
        unless @markdown
          renderer = Redcarpet::Render::HTML.new
          @markdown = Redcarpet::Markdown.new(renderer)
        end

        @markdown.render(text).html_safe
      end
    end

    resource :markdown do
      desc "Convert markdown into html"
      post do
        return markdown(params[:content])
      end
    end
  end
end
