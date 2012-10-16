class Permission < ActiveRecord::Base
  attr_accessible :action, :duser_id, :thing_id, :thing_type
  
  belongs_to :duser
  belongs_to :thing, :polymorphic => true
end
