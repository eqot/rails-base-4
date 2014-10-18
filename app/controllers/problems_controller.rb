class ProblemsController < ApplicationController

  before_action :authenticate

  def index
    @problems = Problem.all.page(params[:page])
  end

  def new
    @problem = current_user.submitted_problems.build
  end

  def create
    @problem = current_user.submitted_problems.build(problem_params)
    if @problem.save
      redirect_to @problem, notice: 'Submitted'
    else
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
    @rating = @problem.rating_problems.find_by(user_id: current_user.id)
  end

  def edit
    @problem = current_user.submitted_problems.find(params[:id])
  end

  def update
    @problem = current_user.submitted_problems.find(params[:id])
    if @problem.update(problem_params)
      redirect_to @problem, notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
    @problem = current_user.submitted_problems.find(params[:id])
    @problem.destroy!
    redirect_to root_path, notice: 'Deleted'
  end

  def sort
    problem = Problem.find(params[:problem_id])
    problem.update(problem_params)
    render nothing: true
  end

  def unlike
    problem = Problem.find(params[:problem_id])
    current_user.unlike!(problem)
    render nothing: true
  end

  private

  def problem_params
    params.require(:problem).permit(
      :title, :description, :row_order_position
    )
  end

end
