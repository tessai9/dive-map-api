# frozen_string_literal: true

class PointsController < ApplicationController
  before_action :authorize_point, only: %i[index create]
  before_action :set_region, only: %i[index show create]
  before_action :set_point, only: %i[show update destroy]

  # GET /regions/{regionId}/point
  def index
    @points = Point.where(region: @region)

    render formats: :json, handlers: :jbuilder
  end

  # GET /regions/{regionId}/points/{pointId}
  def show
    render formats: :json, handlers: :jbuilder
  end

  # POST /regions/{regionId}/point
  def create
    new_point = @region.points.new(permitted_attributes(Point))
    bad_request and return if new_point.invalid?

    new_point.save!
    success
  end

  # PATCH /regions/{regionId}/point/{pointId}
  def update
    @point.assign_attributes(permitted_attributes(@point))
    bad_request and return if @point.invalid?

    @point.save!
    success
  end

  # DELETE /regions/{regionId}/points/{pointId}
  def destroy
    @point.destroy!
    success
  end

  # def update_point_image
  #   # set point object from db
  #   # get image from request
  #   # update s3
  #   # add or update image url for model
  #   # return response
  # end

  private

  def authorize_point
    authorize Point
  end

  def set_region
    @region = Region.find(params[:region_id])
    authorize @region
  end

  def set_point
    @point = Point.find(params[:id])
    authorize @point
  end
end
