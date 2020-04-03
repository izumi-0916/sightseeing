class SpotsController < ApplicationController

  def index
    @images = Image.all
    @spots = Spot.all.order("created_at DESC").limit(4)
    @count = Spot.all
    @num = @count.count
    prefecture = Prefecture.find(1)
    @hokkaidou = prefecture.spots.order("created_at DESC").limit(4)
    prefecture = Prefecture.find(13)
    @tokyo = prefecture.spots.order("created_at DESC").limit(4)
    prefecture = Prefecture.find(27)
    @oosaka = prefecture.spots.order("created_at DESC").limit(4)
    prefecture = Prefecture.find(47)
    @okinawa = prefecture.spots.order("created_at DESC").limit(4)
  end
  
  def new
    @spot = Spot.new
    @spot.images.new
    @spots = Spot.includes(:images).order('created_at DESC')
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path, notice: '投稿しました'
    else
      @spot.images.new
      render :new
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @spots = Spot.all.order("created_at DESC").limit(3)
    @prefecture = Prefecture.find(@spot.prefecture_id)
    @same = @prefecture.spots.order("created_at DESC").limit(3)
    @comments = @spot.comments.includes(:user)
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spot_path(params[:id]), notice: '投稿を編集しました'
    else
      render :edit
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
  end

  private
  def spot_params
    params.require(:spot).permit(:prefecture_id, :name, :place, :text, :station, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
