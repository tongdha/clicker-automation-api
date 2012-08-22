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

        respond_to do |format|
          if @crawler_config.save
            format.html { redirect_to @crawler_config, notice: 'Crawler config was successfully created.' }
            format.json { render json: @crawler_config, status: :created, location: @crawler_config }
          else
            format.html { render action: "new" }
            format.json { render json: @crawler_config.errors, status: :unprocessable_entity }
          end
        end
      end

      # PUT /crawler_configs/1
      # PUT /crawler_configs/1.json
      def update
        @crawler_config = CrawlerConfig.find(params[:id])

        respond_to do |format|
          if @crawler_config.update_attributes(params[:crawler_config])
            format.html { redirect_to @crawler_config, notice: 'Crawler config was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @crawler_config.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /crawler_configs/1
      # DELETE /crawler_configs/1.json
      def destroy
        @crawler_config = CrawlerConfig.find(params[:id])
        @crawler_config.destroy

        respond_to do |format|
          format.html { redirect_to crawler_configs_url }
          format.json { head :no_content }
        end
      end
    end
  end
end