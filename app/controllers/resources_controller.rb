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


end