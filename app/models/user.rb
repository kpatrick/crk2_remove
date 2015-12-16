class User < ActiveRecord::Base
  def can_delete_record?
    ["admin", "editor"].include?(role)
  end
end
