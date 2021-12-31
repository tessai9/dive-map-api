# frozen_string_literal: true

class RegionsController < ApplicationController
  before_action :authorize_region, only: %i[index create]
  before_action :set_region, only: %i[show update destroy]

  # GET /region(?prefecture=xxx)
  def index
    @regions = if params[:prefecture]
                 policy_scope(Region).where(prefecture_id: params[:prefecture])
               else
                 policy_scope(Region).all
               end

    render formats: :json, handlers: :jbuilder
  end

  # GET /regions/{regionId}
  def show
    render formats: :json, handlers: :jbuilder
  end

  # POST /region
  def create
    Region.create!(permitted_attributes(Region))
    success
  end

  # PATCH /regions/{regionId}
  def update
    @region.update!(permitted_attributes(@region))
    success
  end

  # DELETE /regions/{regionId}
  def destroy
    @region.destroy!
    success
  end

  private

  def authorize_region
    authorize Region
  end

  def set_region
    @region = policy_scope(Region).find(params[:id])
    authorize @region
  end
end
