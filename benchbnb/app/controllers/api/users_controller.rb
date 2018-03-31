class Api::UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      login(@user)
      redirect_to new_api_user(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    if @user
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def index
    @users = User.all
    render :index
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to new_api_user(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user
      @user.destroy
      redirect_to api_users
    else
      flash.now[:errors] = ["USER DOESNT EXIST"]
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
