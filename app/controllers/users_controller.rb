class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def index
    @users = User.includes(:employments)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render turbo_stream: [
        turbo_stream.update("personal-data", partial: "users/user",
          locals: {user: @user}),
        turbo_stream.update("replaced", template: "/employments/index")
      ]
    else
      render turbo_stream: turbo_stream.update("replaced", partial: "users/form",
        locals: {user: @user}), status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render turbo_stream: turbo_stream
        .update(@user, partial: "users/user",
          locals: {user: @user})
    else
      render turbo_stream: turbo_stream.update("replaced", partial: "users/form",
        locals: {user: @user}), status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nick_name, :phone_number, :email, :street, :city, :state, :zip)
  end
end
