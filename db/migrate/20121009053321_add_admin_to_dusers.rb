class AddAdminToDusers < ActiveRecord::Migration
  def change
    add_column :dusers, :admin, :boolean
  end
end
