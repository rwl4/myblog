class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "Updated user."
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Created user."
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    flash[:notice] = "Deleted user."
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end
end
