class ResourcesController < ApplicationController
  
  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(name: params[:name], description: params[:description], resource_link: params[:resource_link])
    if @resource.save
      @categorized_resource = CategorizedResource.create(resource_id: @resource.id,resource_category_id: params[:resource_category][:resource_category_id])
      redirect_to "/resource/new"
    end
  end

  def edit 
    @resource = Resource.find_by(id: params[:id])
  end

  def update
    resource = Resource.find_by(id: params[:id])
    # binding.pry
    resource.name = params[:name]
    resource.description = params[:description]
    resource.resource_link = params[:resource_link]
    resource.save
    flash[:success] = "Resource updated"
    redirect_to "/resources"
  end

  def destroy
    resource = Resource.find_by(id: params[:id])
    resource.delete
    flash[:danger] = "Resource deleted"
    redirect_to "/resources"
  end

  def show
    @resouce = Resource.find_by(id: params[:id])
  end
end