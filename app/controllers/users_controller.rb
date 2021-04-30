class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]


  def break
    @user = User.find(current_user.id)
  end

  def like
    @user = User.find(current_user.id)
  end

  def home
    @users = User.all.where.not(sexe: current_user.sexe)
    @userData = @users.length()
    @currentData = rand(0...@userData)
    @user = @users[@currentData]
    @i = 0
    while current_user.following?(@user) &&  @i<10 do
      @currentData = rand(0...@userData)
      @user = @users[@currentData]
      @i=@i+1
    end
  end

  def index
    @user = User.find(8)
    @users = User.all
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
