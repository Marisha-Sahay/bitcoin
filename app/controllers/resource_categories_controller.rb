class ResourceCategoriesController < ApplicationController

  def new
    @resource_category = ResourceCategory.new
  end

  def create
    @resource_category = ResourceCategory.new(name: params[:name])
    @resource_category.save
  end

  def index
    @resouces = ResourceCategory.all
  end

  def show
    @resouce = ResourceCategory.find_by(id: params[:id])
  end

end