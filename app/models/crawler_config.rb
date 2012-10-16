class CrawlerConfig < ActiveRecord::Base
  self.primary_key="crawlerConfigId"
  self.table_name = "crawler_config"
  attr_accessible :description, :crawlingEnabled, :intervalInHours, :allowedFilters, :useSourceId, :startURL, :distributorProfileId, :mediaTypeId, :maxDepth
  
  validates :startURL, :presence => true
  
  has_many :crawl_histories, :foreign_key => "crawlerConfigId", :dependent => :delete_all
  has_many :permissions, :as => :thing
  
  scope :readable_by, lambda { |duser|
    joins(:permissions).where(:permissions => { :action => "view",
                                                :duser_id => duser.id })
  }
  
  def self.for(duser)
    duser.admin? ? CrawlerConfig : CrawlerConfig.readable_by(duser)
  end
  
end