class Admins::UsersController < Admins::BaseController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Create new use successfuly!'
      redirect_to admins_users_path
    else
      render :new
    end
  end

  def update
    if !params[:password].nil?
      if @user.update_without_password(edit_params)
        flash[:notice] = 'update user infomation successfuly'
        redirect_to edit_admins_user_path
      else
        render :edit
      end
    else
      if @user.update(edit_with_pass_params)
        flash[:notice] = 'update user infomation & change password successfuly'
        redirect_to edit_admins_user_path
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to admins_users_path
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def edit_with_pass_params
    params.required(:user).permit(:full_name, :contact_number, :description, :password, :password_confirmation)
  end

  def edit_params
    params.required(:user).permit(:full_name, :contact_number, :description)
  end

  def user_params
    params.required(:user).permit( :email, :full_name, :contact_number, :description, :password, :password_confirmation)
  end

end

