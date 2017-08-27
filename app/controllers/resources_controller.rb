class ResourcesController < ApplicationController

  def index
    @resouces = ["Getting Started","Online Courses","Deep Dive Technical Resources", "Documentaries", "The History of Bitcoin", "Bitcoin Conference Presentations", "Staying Up-to-date", "Miscellaneous Bitcoin Stats", "Buying / Selling bitcoins", "Mining", "Realtime Exchange Data", "Setting up a wallet", "Vendors accepting Bitcoin", "Privacy", "The Lightning Network"]
    # @resouces = Resource.all
  end

  def show
    @resouce = Resource.find_by(id: params[:id])
  end

end
