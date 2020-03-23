class UsersController < ApplicationController
  
  def show
    user = User.find(params[:id])
    @spots = user.spots.order("created_at DESC").page(params[:page]).per(8)
  end
end
