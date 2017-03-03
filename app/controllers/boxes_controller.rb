class BoxesController < ApplicationController

  def index
    @farm = Farm.find(params[:farm_id])
    @boxes = Box.all.where(farm_id: params[:farm_id])
  end

  def show
    @farm = Farm.find(params[:farm_id])
    @boxes = Box.all.where(farm_id: params[:farm_id])
    @box = Box.find(params[:id])
  end

end
