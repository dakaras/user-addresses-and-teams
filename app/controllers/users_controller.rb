class UsersController < ApplicationController
  def new
    @user = User.new
    @user.addresses.build(address_type: "Home")
    @user.addresses.build(address_type: "Work")
    @user.build_team
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      # redirect_to "/users/#{@user.id}"
      # redirect_to @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email, addresses_attributes:[:street, :cross_street, :address_type], team_attributes:[:name, :hometown])
  end
end
