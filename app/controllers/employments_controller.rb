class EmploymentsController < ApplicationController
  before_action :set_employment, only: %i[edit update]
  before_action :set_user, only: %i[index new create]

  def index
    @employments = @user.employments
  end

  def new
    @employment = @user.employments.build
    render turbo_stream: turbo_stream.update("form-button", partial: "employments/form",
      locals: {employment: @employment, user: @user})
  end

  def edit
  end

  def create
    @employment = @user.employments.build(employment_params)
    if @employment.save
      render turbo_stream: [
        turbo_stream.update("form-button", partial: "employments/button",
          locals: {user: @user}),
        turbo_stream.append("employments-data", partial: "employments/employment",
          locals: {employment: @employment, editable: true}),
        turbo_stream.append("employments", partial: "employments/employment",
          locals: {employment: @employment, editable: false})
      ]
    else
      render turbo_stream: turbo_stream.update("form-button", partial: "employments/form",
        locals: {employment: @employment, user: @user}), status: :unprocessable_entity
    end
  end

  def update
    if @employment.update(employment_params)
      render turbo_stream: turbo_stream.update(@employment, partial: "employments/employment",
        locals: {employment: @employment, editable: true})
    else
      render turbo_stream: turbo_stream.update("replaced", partial: "employments/form",
        locals: {employment: @employment}), status: :unprocessable_entity
    end
  end

  private

  def set_employment
    @employment = Employment.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def employment_params
    params.require(:employment).permit(:employer, :start_date, :end_date, :user_id)
  end
end
