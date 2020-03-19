class SpotsController < ApplicationController

  def index
    @spots = Spot.order("created_at DESC")
    @images = Image.all
    @spots = Spot.all
  end
  
  def new
    @spot = Spot.new
    @spot.images.new
    @spots = Spot.includes(:images).order('created_at DESC')
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      @spot.images.new
      render :new
    end
  end

  private
  def spot_params
    params.require(:spot).permit(:prefecture_id, :name, :place, :text, :station, images_attributes: [:src, :_destroy, :id])
  end

end
