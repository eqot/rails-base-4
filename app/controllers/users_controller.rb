class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @problems = @user.problems.rank(:row_order)
  end

end
