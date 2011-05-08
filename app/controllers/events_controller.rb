class UsersController < ApplicationController
  
  before_filter :admin_user, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @events = Event.all
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

  def update
    @event = Event.find(params[:id]
    if @event.update_attributes(params[:event])
      redirect_to(@event, :notice => "Event updated succesfully")
    else
      render :action => "edit"
    end

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

end
