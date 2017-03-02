class BoxesController < ApplicationController

  def index
    @boxes = Box.all.where(farm_id: params[:farm_id])
  end

  def show
    @box = Box.find(params[:id])
  end

end
