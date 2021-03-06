class ResourcesController < ApplicationController
  
  def index
    @resources = Resource.all 
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(name: params[:name], short_desc: params[:short_desc], description: params[:description], resource_link: params[:resource_link])
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
    resource.short_desc = params[:short_desc]
    if resource.save
      flash[:success] = "Resource updated"
      redirect_to "/resources"
    end
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

  def upvote
    @resouce = Resource.find(params[:id])
    @resouce.vote_by :voter => current_user
  end

  def downvote
    @resouce = Resource.find(params[:id])
    @resouce.downvote_from current_user
  end

  def search
    @resources = Resource.where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(short_desc) LIKE ?", "%#{params[:user_search].downcase}%", "%#{params[:user_search].downcase}%", "%#{params[:user_search].downcase}%")
    render :index
  end
end
