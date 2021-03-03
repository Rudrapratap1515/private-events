class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  def new
    @event = Event.new
  end

  def index
    @event = Event.all
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event details are saved" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :date, :about, :user_id)
  end
end