class User < ApplicationRecord
  has_many :todos, :dependent => :destroy
  has_secure_password
  validates :email_address, presence: true
  validates :password, presence: true

  def format_user
    "#{id}.#{user_name} - #{email_address}"
  end
end
