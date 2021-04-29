class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]


  def home
    @userData = User.all.length
    @currentData = rand(1..@userData)
    @user = User.find(@currentData)
    if params[:id]
      if params[:id].to_i > @userData
        @currentData = 0
      else
        @currentData =  params[:id].to_i + 1
        @user = User.find(params[:id])
      end
    end
  end

  def index
    @users = User.all.where.not(sexe: current_user.sexe)
     render json: @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
        render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'profile mise a jour !'
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'profil supprimee!'
    redirect_to recettes_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :sexe, :profil, :bio, :age, :pays, :ville, :password, :password_confirmation)
  end
  def set_user
   @user = User.find(params[:id])
  end
end
