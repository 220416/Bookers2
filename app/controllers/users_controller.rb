class UsersController < ApplicationController
  def show
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
        flash[:notice] = "You have updated user successfully."
      redirect_to  user_path(@user)
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  # meshiterro
end