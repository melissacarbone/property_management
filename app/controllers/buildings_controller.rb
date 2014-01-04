class BuildingsController < ApplicationController
  def new
    @building = Building.new
  end

  def index
    @buildings = Building.all
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to new_building_path, notice: 'Building was successfully created!'
    else
      render 'new'
    end
  end

  private

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :zip, :description)
  end
end
