class Admin::DusersController < Admin::BaseController
  def index
      @dusers = Duser.all(:order => "email")
  end
  
  def new
      @duser = Duser.new
  end
  
  def create
    @duser = Duser.new(params[:duser])
    @duser.admin = params[:duser][:admin] == "1"
    if @duser.save
      flash[:notice] = "User has been created."
      redirect_to admin_dusers_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end
end
