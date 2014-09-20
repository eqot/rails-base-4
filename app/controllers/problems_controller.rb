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

  private

  def problem_params
    params.require(:problem).permit(
      :title, :description
    )
  end

end
