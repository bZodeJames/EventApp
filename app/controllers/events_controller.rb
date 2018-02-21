class EventsController < ApplicationController
  before_action :set_event_item, only: [:edit, :update, :show, :destroy, :register]

  def index
    @event_items = Event.all    
  end

  def sort
    params[:order].each do |key, value|
      Event.find(value[:id]).update(position: value[:position])
    end
    head :ok
  end

  def new
    @event_item = Event.new
  end

  def create
    @event_item = current_user.events.new(event_params)

    respond_to do |format|
      if @event_item.save
        format.html { redirect_to @event_item, notice: 'Event item was made' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    if current_user.id == @event_item.user_id
    respond_to do |format|
      if @event_item.update(event_params)
        format.html { redirect_to event_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  end

  def show
  end

  def destroy
    if current_user.id == @event_item.users_id
    #Performs lookup
    #Destroy record
    @event_item.destroy
    
    #Redirects
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event deleted.' }
    end
  end
  end

  def register
    @event_item.registrations.create(user_id: current_user.id)
    redirect_to events_url
  end

  private
  def event_params
      params.require(:event).permit(:title, 
                                      :description,
                                      :main_image,
                                      :date,
                                      :time,
                                      :location,
                                      :event_type
                                       )
  end

    def set_event_item
      @event_item = Event.find(params[:id])
    end
  end