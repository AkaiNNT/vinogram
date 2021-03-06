class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :follow_show, :follow]
  before_action :set_current_user, only: [:edit, :update]
  before_action :search_form

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice: "Edit profile successful!"
    else
      render 'edit'
    end
  end

  def suggested
    users_all = User.all.pluck(:id)
    all_following = current_user.followings.pluck(:following_id)
    #get following_id which has status 0_pending
    following_has_status_zero = Following.where(follower: current_user, status: 'pending').pluck(:following_id)
    #get following_id except which has status 0
    following = all_following - following_has_status_zero

    @users_ids =  users_all - following
    @users_ids.delete(current_user.id)
    @users = User.where(id: @users_ids)
  end

  def follow
    if current_user.followings.where(following: @user).any?
      current_user.followings.where(following: @user).destroy_all
      @user_status = 'follow'
    else
      fl = current_user.followings.new(following: @user)
      fl.status = @user.privacy? ? 'pending' : 'following'
      @user_status = fl.status
      fl.save
    end
    respond_to do |format|
      format.js
    end
  end
    # if  fl.save
    #   # redirect_to  suggested_users_path, notice: "Follow successfully!"
    # else
    #   redirect_to  suggested_users_path, notice: fl.errors.full_messages.join(', ')
    # end

  def destroy_following
    user = User.find(params[:id])
    current_user.followings.where(following_id: user.id).destroy_all
  end

  def approve_follower
    follower = User.find(params[:id])
    f = current_user.followers.where(follower: follower).last
    f.status = 'following'
    if f.save
    else
        redirect_to  suggested_users_path, notice: f.errors.full_messages.join(', ')
    end
  end

  def search_navbar
    if params[:search].to_s == ""
      @users = User.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    else
      @users = []
      search = params[:search]
      list = User.where("email || ' ' || full_name || ' ' || contact_number ILIKE ?", "%#{search}%").paginate(:page => params[:page], :per_page => 5)
      a = list.to_a
      list.each do |u|
        f = u.followers
        f.each do |t|
          current_user.followings.each do |c|
            if c.follower_id == t.follower_id && c.following_id == t.following_id
              if c.status == 'following'
                a.delete(u)
              end
            end
          end
        end
      end
      @users = a
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def following_params
    params.require(:following).permit(:following, :follower, :status)
  end

  def user_params
    params.require(:user).permit(:fullname, :contact_number, :contact_area, :description, :avatar, :status)
  end

  def search_form
    @search = ""
  end

end
