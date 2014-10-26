class IdeasController < ApplicationController

  before_action :authenticate, except: [:index, :show]
  before_action :set_type

  def index
    @ideas = type_class.order('created_at DESC, id DESC').page(params[:page])
  end

  def new
    @idea = current_user.submitted_ideas.build
  end

  def create
    @idea = current_user.submitted_ideas.build(idea_params)
    if @idea.save
      @idea.rate!(current_user, :impact, params[:idea][:impact])
      @idea.rate!(current_user, :frequency, params[:idea][:frequency])

      redirect_to @idea, notice: 'Submitted'
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])

    if signed_in?
      @rating = @idea.rating_ideas.find_by(user_id: current_user.id)
    end
  end

  def edit
    @idea = current_user.submitted_ideas.find(params[:id])
    @rating = @idea.rating_ideas.find_by(user_id: current_user.id)
  end

  def update
    @idea = current_user.submitted_ideas.find(params[:id])
    if @idea.update(idea_params)
      @idea.rate!(current_user, :impact, params[:idea][:impact])
      @idea.rate!(current_user, :frequency, params[:idea][:frequency])

      redirect_to @idea, notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
    @idea = current_user.submitted_ideas.find(params[:id])
    @idea.destroy!
    redirect_to root_path, notice: 'Deleted'
  end

  def sort
    idea = Idea.find(params[:idea_id])
    idea.update(idea_params)
    render nothing: true
  end

  def unlike
    idea = Idea.find(params[:idea_id])
    current_user.unlike!(idea)
    render nothing: true
  end

  private

  def idea_params
    params.require(:idea).permit(
      :title, :description, :attached_tags, :file, :file_cache, :remove_file, :row_order_position
    )
  end

  def set_type
     @type = type
  end

  def type
    Idea.types.include?(params[:type]) ? params[:type] : "Idea"
  end

  def type_class
    type.constantize
  end

end
