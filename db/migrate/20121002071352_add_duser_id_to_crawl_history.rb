class AddDuserIdToCrawlHistory < ActiveRecord::Migration
  def change
    add_column :crawl_history, :duser_id, :integer
  end
end
