class Api::ResourcesController < ApplicationController
  before_action :set_definition_model
  before_action :set_api_resource, only: [:show, :update, :destroy]

  # GET /api/resources/:model_slug
  def index
    @api_resources = @definition_model.try(:api_resources)

    render json: @api_resources.try(:map) { |resource| { id: resource.id }.merge(resource.content) } || []
  end

  # GET /definition/models/1
  def show
    render json: { id: @api_resource.id }.merge(@api_resource.try(:content)) || {}
  end

  # POST /definition/models
  def create
    @api_resource = Api::Resource.new(definition_model: @definition_model)

    if !SaveResource.new(@api_resource, api_resource_params).call.errors.any?
      render json: @api_resource.content,
             status: :created,
             location: api_resource_path(@definition_model.slug, @api_resource.id)
    else
      render json: @api_resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /definition/models/1
  def update
    if !SaveResource.new(@api_resource, api_resource_params).call.errors.any?
      render json: @api_resource.content
    else
      render json: @definition_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /definition/models/1
  def destroy
    @api_resource.destroy
  end

  private

  def api_resource_params
    params.require(:api_resource).permit!
  end

  def set_definition_model
    @definition_model = Definition::Model.find_by(slug: params[:model_slug])
  end

  def set_api_resource
    @api_resource = @definition_model.try(:api_resources).try(:find, params[:id])
  end
end
