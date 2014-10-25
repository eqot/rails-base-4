class TagsController < ApplicationController

  def index
    @tags = Tag.all
    render 'index', formats: :json, handlers: :jbuilder
  end

end
