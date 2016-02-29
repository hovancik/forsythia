class TrackingsController < ApplicationController
  before_filter :authorize
  def new
    @tracking = Tracking.new
    @clients = current_user.try(:clients)
  end

  def create
    @tracking = Tracking.new(tracking_params)
    if @tracking.save
      redirect_to root_path
      flash[:success] = "Work must go on!"
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  private

  def tracking_params
    params.require(:tracking).permit(:started_at, :ended_at, :client_id)
  end
end
