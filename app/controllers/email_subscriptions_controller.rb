class EmailSubscriptionsController < ApplicationController

  def create
    @subscriber = EmailSubscription.new(email: params[:email])
    if @subscriber.valid?
      @subscriber.save
      respond_to do |format|
        format.json { render :json => {:message => "Thank you for subscribing!"} }
      end
    else
      respond_to do |format|
        format.json { render :json => {:message => "Invalid email, try again."} }
      end
    end
  end

  private

  def email_params
    params.permit(:email)
  end

end
