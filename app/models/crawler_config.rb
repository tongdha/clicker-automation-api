class CrawlerConfig < ActiveRecord::Base
  self.primary_key="crawlerConfigId"
  self.table_name = "crawler_config"
  attr_accessible :description, :crawlingEnabled, :intervalInHours, :allowedFilters, :useSourceId
end
