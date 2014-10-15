class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @problems = Problem.all
  end

end
