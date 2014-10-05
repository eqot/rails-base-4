module Markdown
  class API < Grape::API
    version 'v1', using: :path
    format :txt
    prefix :api

    helpers do
      def markdown(text)
        Downr::Markdown.render(text).html_safe
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
