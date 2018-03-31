class Api::SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to new_api_user(@user)
    else
      flash.now[:errors] = ["Invalid credentials"]
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user
      render json: {}
    else
      render json: @user.errors.full_messages, status: 404
    end
  end
end
