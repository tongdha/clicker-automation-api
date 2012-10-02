class AddConfirmableFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :dusers, :confirmation_token, :string
    add_column :dusers, :confirmed_at, :datetime
    add_column :dusers, :confirmation_sent_at, :datetime
  end
end
