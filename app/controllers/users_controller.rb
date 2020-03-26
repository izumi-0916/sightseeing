class UsersController < ApplicationController
  
  def show
    user = User.find(params[:id])
    @likes = Like.where(user_id: current_user.id).order("created_at DESC")
    @spots = user.spots.order("created_at DESC")
  end
end
