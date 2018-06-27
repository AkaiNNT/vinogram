class Admins::UsersController < Admins::BaseController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :search_form
  def index
    if params[:search].to_s == ""
      @users = User.all.order(id: :asc).paginate(:page => params[:page], :per_page => 5)
    else
      search = params[:search]
      @users = User.where("email || ' ' || full_name || ' ' || contact_number ILIKE ?", "%#{search}%").paginate(:page => params[:page], :per_page => 5)
    end
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
      if params[:user][:password].to_s != ""
        if params[:user][:avatar].to_s != ""
          if @user.update(edit_with_avatar_and_pass_params)
            flash[:notice] = 'update user infomation, avatar & change password successfuly'
            redirect_to edit_admins_user_path
          else
            render :edit
          end
        else
          if @user.update(edit_with_pass_but_with_out_avatar_params)
            flash[:notice] = 'update user infomation & change password successfuly'
            redirect_to edit_admins_user_path
          else
            render :edit
          end
        end
      else
        if params[:user][:avatar].to_s != ""
          if @user.update_without_password(edit_with_avatar_but_with_out_pass_params)
            flash[:notice] = 'update user infomation & avatar successfuly'
            redirect_to edit_admins_user_path
          else
            render :edit
          end
        else
          if @user.update_without_password(edit_with_out_avatar_and_pass_params)
            flash[:notice] = 'update user infomation successfuly'
            redirect_to edit_admins_user_path
          else
            render :edit
          end
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

  def edit_with_avatar_and_pass_params
    params.required(:user).permit( :avatar,:full_name, :contact_number, :description, :password, :password_confirmation)
  end

  def edit_with_pass_but_with_out_avatar_params
    params.required(:user).permit(:full_name, :contact_number, :description, :password, :password_confirmation)
  end

  def edit_with_avatar_but_with_out_pass_params
    params.required(:user).permit(:avatar,:full_name, :contact_number, :description)
  end

  def edit_with_out_avatar_and_pass_params
    params.required(:user).permit(:full_name, :contact_number, :description)
  end

  def user_params
    params.required(:user).permit( :email, :full_name, :contact_number, :description, :password, :password_confirmation)
  end

  def search_form
    @search = ""
  end

end

