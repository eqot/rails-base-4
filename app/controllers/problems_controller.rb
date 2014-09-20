class ProblemsController < ApplicationController

  before_action :authenticate

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

  private

  def problem_params
    params.require(:problem).permit(
      :title, :description
    )
  end

end
