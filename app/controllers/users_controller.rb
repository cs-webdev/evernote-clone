class UsersController < Clearance::UsersController
  authorize_resource
  skip_authorize_resource :only => :create

  def show
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to '/'
    else
      render template: 'users/new'
    end 
  end 

  def delete
    User.find(current_user.id).destroy
    # current_user = nil
    flash[:alert] = "You deleted your account successfuly."
    redirect_to root_path
  end

  private

  def user_from_params
    user_params = params[:user] || Hash.new
    username = user_params.delete(:username)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.username = username
      user.email = email
      user.password = password
    end
  end
end
