class CrawlHistoriesController < ApplicationController
  before_filter :find_crawler_config
  before_filter :find_crawl_history, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy,
                                        :watch]
  before_filter :authenticate_duser!, :except => [:index, :show]
  
  def show
  end
  
  def edit
  end
  
  def new
    @crawl_history = @crawler_config.crawl_histories.build
  end
  
  def create
    @crawl_history = @crawler_config.crawl_histories.build(params[:crawl_history].merge!(:duser => current_duser))
    if @crawl_history.save
      flash[:notice] = "Crawl History has been created."
      redirect_to [@crawler_config, @crawl_history]
    else
      flash[:alert] = "Crawl History has not been created."
      render :action => "new"
    end
  end
  
  def update
    if @crawl_history.update_attributes(params[:crawl_history])
      flash[:notice] = "Crawl history has been updated."
      redirect_to [@crawler_config, @crawl_history]
    else
      flash[:alert] = "Crawl history has not been updated."
      render :action => "edit"
    end
  end  
  
  def destroy
      @crawl_history.destroy
      flash[:notice] = "Crawl history has been deleted."
      redirect_to @crawler_config
  end
  
  
  
  private
    def find_crawler_config
      @crawler_config = CrawlerConfig.find(params[:crawler_config_id])
    end
      
    def find_crawl_history
      @crawl_history = @crawler_config.crawl_histories.find(params[:id])
    end
end
