class CreateCrawlerConfigs < ActiveRecord::Migration
  def change
    create_table :crawler_configs do |t|

      t.timestamps
    end
  end
end
