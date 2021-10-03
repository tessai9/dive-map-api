class PointsController < ApplicationController
  before_action :set_region
  before_action :set_point, only: %i[show update destroy]

  # GET /region/{regionId}/point
  def index
    @points = Point.find_by(region: @region)

    render formats: :json, handlers: :jbuilder
  end

  # GET /region/{regionId}/points/{pointId}
  def show
    render formats: :json, handlers: :jbuilder
  end

  # POST /region/{regionId}/point
  def create
    new_point = Point.new(region_params)
    bad_request if new_point.invalid?

    new_point.save!
    success
  end

  # PATCH /region/{regionId}/point/{pointId}
  def update
    @point.assign_attributes(point_params)
    bad_request if @point.invalid?

    @point.save!
    success
  end

  # DELETE /region/{regionId}/points/{pointId}
  def destroy
    @point.destroy!
    success
  end

  private

  def set_region
    @region = Region.find(params[:region])
  end

  def set_point
    @point = Point.find(params[:point])
  end

  def point_params
    params.require(:point).permit(:name, :point_map)
  end
end
