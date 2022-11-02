class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    
    if @event.save
      redirect_to @event
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def correct_user
    @event = Event.find_by(id: params[:id])
    unless current_user == @event.creator
      redirect_to user_path(current_user)
    end
  end

  def event_params
    params.require(:event).permit(:name, :date, :location, :user_id)
  end

end
