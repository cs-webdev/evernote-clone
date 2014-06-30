class UsersController < Clearance::UsersController
  authorize_resource

  def show

  end
end
