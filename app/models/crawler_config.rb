class CrawlerConfig < ActiveRecord::Base
  self.primary_key="crawlerConfigId"
  self.table_name = "crawler_config"
  attr_accessible :description, :crawlingEnabled, :intervalInHours, :allowedFilters, :useSourceId, :startURL, :distributorProfileId, :mediaTypeId, :maxDepth
  
  validates :startURL, :presence => true
  
  has_many :crawl_histories, :foreign_key => "crawlerConfigId", :dependent => :delete_all
  
end
