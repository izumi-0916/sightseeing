class PrefecturesController < ApplicationController

  def show
    prefecture = Prefecture.find(params[:id])
    @spots = prefecture.spots.order("created_at DESC").page(params[:page]).per(16)
    @name = prefecture.name
  end

end
