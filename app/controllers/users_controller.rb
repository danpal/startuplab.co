class UsersController < ApplicationController
  
  before_filter :admin_user, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:show]

  def index
    @users = User.all
  end


  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'User was successfully updated.' 
    else
      render :action => "edit" 
    end
  
  end

  def show
    @user = User.find(params[:id])
    if !@user
      redirect_to index_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private 

  def correct_user
    @user = User.find(params[:id])
    redirect_to (index_path) unless (current_user.admin? if current_user || (@user.id == current_user.id if @user))
  end

end
