class CrawlerConfig < ActiveRecord::Base
  self.primary_key="crawlerConfigId"
  self.table_name = "crawler_config"
  attr_accessible :description, :crawlingEnabled, :intervalInHours, :allowedFilters, :useSourceId, :startURL, :distributorProfileId, :mediaTypeId, :maxDepth
  
  has_many :crawl_histories, :foreign_key => "crawlerConfigId"
  
end
