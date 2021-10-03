class PointsController < ApplicationController
  before_action :set_region

  # GET /region/:region_id/point
  def index
    @points = Point.find_by(region: @region)
  end

  private

  def set_region
    @region = Region.find(params[:region])
  end

  def point_params
    params.require(:point).permit(:name, :point_map)
  end
end
