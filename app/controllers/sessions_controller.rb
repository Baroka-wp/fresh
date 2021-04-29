class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
  end
  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_path
   else
     flash.now[:danger] = 'connexion échouée'
    render :new
   end
  end

    def destroy
     session.delete(:user_id)
     flash[:notice] = 'vous êtes déconnecté'
     redirect_to new_session_path
    end
  end
