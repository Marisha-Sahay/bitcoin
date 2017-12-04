class ResourceCategoriesController < ApplicationController

  def new
    @resource_category = ResourceCategory.new
  end

  def create
    @resource_category = ResourceCategory.new(name: params[:name], description: params[:description])
    @resource_category.save
    redirect_to '/resources'
  end

  def index
    @resouces = ResourceCategory.order(updated_at: :desc)
  end

  def show
    @resouce = ResourceCategory.find_by(id: params[:id])
  end

end
