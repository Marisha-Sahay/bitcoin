class ResourceCategoriesController < ApplicationController

  def index
    @resouces = ResourceCategory.all
  end

  def show
    @resouce = ResourceCategory.find_by(id: params[:id])
  end

end
