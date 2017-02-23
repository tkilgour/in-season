class CropsController < ApplicationController
  def show
    @crops = Crop.find(param[:id])
  end
end
