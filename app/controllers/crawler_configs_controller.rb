class CrawlerConfigsController < ApplicationController
  
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :authenticate_duser!, :only => [:index, :show]
  before_filter :find_crawler_config, :only => [:show, :edit, :update, :destroy]
  
  respond_to :json, :xml
  
  # GET /crawler_configs
  # GET /crawler_configs.json
  def index
    @crawler_configs = CrawlerConfig.for(current_duser).all
  end

  # GET /crawler_configs/1
  # GET /crawler_configs/1.json
  def show
  end

  # GET /crawler_configs/new
  # GET /crawler_configs/new.json
  def new
    @crawler_config = CrawlerConfig.new
  end

  # GET /crawler_configs/1/edit
  def edit
  end

  # POST /crawler_configs
  # POST /crawler_configs.json
  def create
    @crawler_config = CrawlerConfig.new(params[:crawler_config])
    if @crawler_config.save
      flash[:notice] = "Crawler Config has been created!"
      redirect_to @crawler_config
    else
      flash[:alert] = "Crawler Config has NOT been created!"
      render :action => "new"
    end
  end

  # PUT /crawler_configs/1
  # PUT /crawler_configs/1.json
  def update
    if @crawler_config.update_attributes(params[:crawler_config])
      flash[:notice] = "Crawler Config has been updated!"
      redirect_to @crawler_config
    else
      flash[:alert] = "Crawler Config has NOT been updated!"
      render :action => "edit"
    end
  end

  # DELETE /crawler_configs/1
  # DELETE /crawler_configs/1.json
  def destroy
    @crawler_config.destroy
    flash[:notice] = "Crawler Config has been deleted!"
    redirect_to crawler_configs_path
  end
  
  private
    def find_crawler_config
      #@crawler_config = CrawlerConfig.find(params[:id])
      @crawler_config = CrawlerConfig.for(current_duser).find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The crawler config you were looking" +
                      " for could not be found."
      redirect_to crawler_configs_path
    end
end
