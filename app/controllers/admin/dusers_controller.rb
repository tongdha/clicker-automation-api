class Admin::DusersController < Admin::BaseController
  
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  
  def index
      @dusers = Duser.all(:order => "email")
  end
  
  def show
  end

  def edit
  end
  
  def update
    if params[:duser][:password].blank?
      params[:duser].delete(:password)
      params[:duser].delete(:password_confirmation)
    end
    set_admin
    if @duser.update_attributes(params[:duser])
      flash[:notice] = "User has been updated."
      redirect_to admin_dusers_path
    else
      flash[:alert] = "User has not been updated."
      render :action => "edit"
    end
  end
  
  def new
      @duser = Duser.new
  end
  
  def destroy
    if @duser == current_duser
      flash[:alert] = "You cannot delete yourself!"
    else
      @duser.destroy
      flash[:notice] = "User has been deleted."
    end

    redirect_to admin_dusers_path
  end
  
  def create
    set_admin
    @duser.admin = params[:duser][:admin] == "1"
    if @duser.save
      flash[:notice] = "User has been created."
      redirect_to admin_dusers_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end
  
  private
    def find_user
      @duser = Duser.find(params[:id])
    end
  
    def set_admin
      @duser.admin = params[:duser][:admin] == "1"
    end
end
