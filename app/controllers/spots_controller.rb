class SpotsController < ApplicationController

  def index
    @images = Image.all
    @spots = Spot.all.order("created_at DESC").limit(10)
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

  def show
    @spot = Spot.find(params[:id])
  end

  private
  def spot_params
    params.require(:spot).permit(:prefecture_id, :name, :place, :text, :station, images_attributes: [:src, :_destroy, :id])
  end

end
