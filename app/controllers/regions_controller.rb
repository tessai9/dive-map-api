class RegionsController < ApplicationController
  before_action :set_region, only: %i[show update destroy]

  # GET /region(?prefecture=xxx)
  def index
    @regions = if params[:prefecture]
                 Region.where(prefecture: params[:prefecture])
               else
                 Region.all
               end

    render formats: :json, handlers: :jbuilder
  end

  # GET /regions/{regionId}
  def show
    render formats: :json, handlers: :jbuilder
  end

  # POST /region
  def create
    bad_request and return if params_valid?
    Region.create!({
                     name: region_params[:name],
                     prefecture: Prefecture.find(region_params[:prefecture])
                   })
    success
  end

  # PATCH /regions/{regionId}
  def update
    bad_request and return if params_valid?
    @region.update!({
                     name: region_params[:name],
                     prefecture: Prefecture.find(region_params[:prefecture])
                   })
    success
  end

  # DELETE /regions/{regionId}
  def destroy
    @region.destroy!
    success
  end

  private

  def region_params
    params.require(:region).permit(:name, :prefecture)
  end

  def params_valid?
    region_params[:prefecture].nil? || region_params[:name].nil?
  end

  def set_region
    @region = Region.find(params[:id])
  end
end
