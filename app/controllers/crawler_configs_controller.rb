class CrawlerConfigsController < ApplicationController
  
  respond_to :json, :xml
  
  # GET /crawler_configs
  # GET /crawler_configs.json
  def index
    @crawler_configs = CrawlerConfig.all
  end

  # GET /crawler_configs/1
  # GET /crawler_configs/1.json
  def show
    @crawler_config = CrawlerConfig.find(params[:id])
  end

  # GET /crawler_configs/new
  # GET /crawler_configs/new.json
  def new
    @crawler_config = CrawlerConfig.new
  end

  # GET /crawler_configs/1/edit
  def edit
    @crawler_config = CrawlerConfig.find(params[:id])
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
    @crawler_config = CrawlerConfig.find(params[:id])
    
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
    @crawler_config = CrawlerConfig.find(params[:id])
    @crawler_config.destroy
    
    @crawler_config.destroy
    flash[:notice] = "Crawler Config has been deleted!"
    redirect_to crawler_configs_path
  end
end
