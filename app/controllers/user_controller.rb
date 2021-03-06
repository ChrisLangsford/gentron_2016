class UserController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout 'staff_layout'


  def index
    @users = User.all
    #excludes(:id => current_user.id) 

  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = "123456"
    @user.password_confirmation = "123456"
    if @user.save
      #flash[:notice] = "Successfully created User." 
      redirect_to user_index_path
    else
      render :action => 'new'
    end
  end

  def edit 

  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(user_params)
      #flash[:notice] = "Successfully updated User."
      redirect_to user_index_path
    else
      render :action => 'edit'
    end
  end

  def destroy    
    if @user.destroy
      #flash[:notice] = "Successfully deleted User."
      redirect_to user_index_path
    end
  end 

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
