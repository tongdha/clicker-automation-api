module Api
  module V1
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
        @crawler_config.save
        respond_with @crawler_config
      end

      # PUT /crawler_configs/1
      # PUT /crawler_configs/1.json
      def update
        @crawler_config = CrawlerConfig.find(params[:id])
        @crawler_config.update_attributes(params[:crawler_config])
        respond_with @crawler_config
      end

      # DELETE /crawler_configs/1
      # DELETE /crawler_configs/1.json
      def destroy
        @crawler_config = CrawlerConfig.find(params[:id])
        @crawler_config.destroy
        respond_with @crawler_config
      end
    end
  end
end