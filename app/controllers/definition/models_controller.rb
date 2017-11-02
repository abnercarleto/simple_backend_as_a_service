class Definition::ModelsController < ApplicationController
  before_action :set_definition_model, only: [:show, :update, :destroy]

  # GET /definition/models
  def index
    @definition_models = Definition::Model.all

    render json: @definition_models
  end

  # GET /definition/models/1
  def show
    render json: @definition_model
  end

  # POST /definition/models
  def create
    @definition_model = Definition::Model.new(definition_model_params)

    if @definition_model.save
      render json: @definition_model, status: :created, location: @definition_model
    else
      render json: @definition_model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /definition/models/1
  def update
    if @definition_model.update(definition_model_params)
      render json: @definition_model
    else
      render json: @definition_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /definition/models/1
  def destroy
    @definition_model.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition_model
      @definition_model = Definition::Model.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def definition_model_params
      params.require(:definition_model).permit(:name, definition_attributes_attributes: [:name, :kind, :kind_cd])
    end
end
