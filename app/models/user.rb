class User < ActiveRecord::Base
  include Clearance::User

  validates :username, length: { maximum: 40, too_long: "must have at most %{count} characters" }

  def display_name
    username.presence || email
  end

end
