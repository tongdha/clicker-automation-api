class CrawlHistory < ActiveRecord::Base
  self.primary_key="crawlHistoryId"
  self.table_name = "crawl_history"
  attr_accessible :startTime, :endTime, :totalTimeInSecs, :ip, :pid
  
  validates :ip, :presence => true
  
  belongs_to :crawler_config, :foreign_key => 'crawlerConfigId', :class_name => "CrawlerConfig"
end
