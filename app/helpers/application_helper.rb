module ApplicationHelper
  def admins_only(&block)
    block.call if current_duser.try(:admin?)
    nil
  end
end
