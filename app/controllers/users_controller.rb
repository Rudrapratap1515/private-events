class UsersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]
  def new 
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User details are saved" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_member
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :address, :age, :phone)
  end
end
