class TrackingsController < ApplicationController
  before_filter :authorize

  def new
    @tracking = current_user.trackings.new
    @clients = current_user.try(:clients)
  end

  def create
    @tracking = current_user.trackings.new(tracking_params)
    if @tracking.save
      redirect_to root_path
      flash[:success] = "Work must go on!"
    else
      render 'new'
    end
  end

  def update
  end

  def end
    tracking = current_user.trackings.find(params[:id])
    tracking.update(ended_at: Time.now)
    redirect_to '/trackings'
  end

  def edit
  end

  def index
    @trackings = Tracking.group_by_day(current_user.trackings)
  end

  private

  def tracking_params
    params.require(:tracking).permit(:started_at, :ended_at, :client_id)
  end
end
