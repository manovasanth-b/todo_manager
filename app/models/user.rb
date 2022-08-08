class User < ActiveRecord::Base
  def format_user
    "#{id}.#{user_name} - #{email_address}"
  end
end
