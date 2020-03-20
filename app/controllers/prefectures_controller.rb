class PrefecturesController < ApplicationController

  def show
    prefecture = Prefecture.find(params[:id])
    @spots = prefecture.spots
    @name = prefecture.name
  end

end
