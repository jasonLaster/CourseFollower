class UsersController < ApplicationController
  respond_to :html
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.course = Course.find_by_crn(params[:user][:crn])
      @user.save
      redirect_to(@user)
    else
      respond_with(@user)
    end
  end
end

