class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :follow_show, :follow]
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice: "Edit profile successful!"
    else
      render 'edit'
    end
  end

  def show
  end

  def suggested
    users_all = User.all.pluck(:id)
    following = current_user.followings.pluck(:following_id)
    @user_ids =  users_all - following
    @users = User.where(id: @user_ids)
  end

  def follow
    fl = current_user.followings.new(following: @user)
    fl.status = @user.privacy? ? 0 : 1
    if  fl.save
      redirect_to  suggested_users_path, notice: "Follow successfully!"
    else
      redirect_to  suggested_users_path, notice: fl.errors.full_messages.join(', ')
    end

  end

def set_user
   @user = User.find(params[:id])
 end
 private 
 def following_params
  params.require(:following).permit(:following, :follower, :status)
end
def user_params
  params.require(:user).permit(:fullname, :contact_number, :contact_area, :description, :avatar, :status)
end
end
