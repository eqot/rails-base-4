class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas.rank(:row_order)
  end

end
