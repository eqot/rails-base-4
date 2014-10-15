class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @problems = @user.problems
  end

end
