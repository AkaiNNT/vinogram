class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
       flash[:success] = "Edit Profile successfully!"
      redirect_to home_index_path 

    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private 
  def user_params
    params.require(:user).permit(:fullname, :contact_number, :contact_area, :description, :avatar)
  end
end
