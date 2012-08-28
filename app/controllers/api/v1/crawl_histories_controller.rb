module Api
  module V1
    class CrawlHistoriesController < ApplicationController

      respond_to :json, :xml

      def index
        @crawl_histories = CrawlHistory.all
      end

      def show
        @crawl_history = CrawlHistory.find(params[:id])
      end

      def create
        @crawl_history = CrawlHistory.new(params[:crawler_history])
        @crawl_history.save
        respond_with @crawler_config
      end

      def update
        @crawl_history = CrawlHistory.find(params[:id])
        @crawl_history.update_attributes(params[:crawler_history])
        respond_with @crawler_config
      end

      def destroy
        @crawl_history = CrawlHistory.find(params[:id])
        @crawl_history.destroy
        respond_with @crawl_history
      end
      
      def manage
        @crawl_histories = crawler_config.crawl_histories
      end
      
      protected
      
        def crawler_config
          @crawler_config ||= CrawlerConfig.find(params[:crawler_config_id])
        end
    end
  end
end