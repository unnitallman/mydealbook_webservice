class PropertiesController < ApplicationController
  respond_to :json

  def index
    @properties = Property.all 
    render json: @properties
  end

  def show
    @property = Property.find(params[:id])
    render json: @property
  end

  def new
    @property = Property.new
    render json: @property
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def update
    @property = Property.find(params[:id])

    if @property.update_attributes(property_params)
      head :no_content
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    head :no_content
  end

  private

  def property_params
    params[:property].permit(:name, :description, :address)
  end
end