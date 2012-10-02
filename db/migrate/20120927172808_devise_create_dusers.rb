class DeviseCreateDusers < ActiveRecord::Migration
  def self.up
    create_table(:dusers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :dusers, :email,                :unique => true
    add_index :dusers, :reset_password_token, :unique => true
    # add_index :dusers, :confirmation_token,   :unique => true
    # add_index :dusers, :unlock_token,         :unique => true
    # add_index :dusers, :authentication_token, :unique => true
  end

  def self.down
    drop_table :dusers
  end
end
