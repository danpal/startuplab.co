class EventsController < ApplicationController
  
  before_filter :admin_user, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @events = Event.all(conditions: {active: "true"})
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if(@event.save)
      redirect_to(@event, :notice => "Event succesfully created")
    else
      render :action => new
    end

  end

  def show
    @event = Event.find(params[:id])
    
  end

  def edit
    @event = Event.find(params[:id])
  end

  # Since :name is also a key to allow updating the name
  # we need to check the params, if they try updating the name
  # we need to create a new event, with a new name and delete the old one

  def update
    puts "*******ON UPDATE ************"
    @event = Event.find(params[:id])

    #check if user is trying to change the name
    puts "#{@event.name} == @event.name #{params[:event][:name]} = params[:name]"
    if (@event.name != params[:event][:name])
      new_event = @event.dup
      new_event.name = params[:event][:name]
      if new_event.save!
        redirect_to(new_event, :notice => "Event updated succesfully") 
        @event.destroy
      else
        render :action => "edit"
      end
      
    else
      if @event.update_attributes!(params[:event])
        redirect_to(@event, :notice => "Event updated succesfully")
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(events_path, :notice => "Event Destroyed")
  end


end
