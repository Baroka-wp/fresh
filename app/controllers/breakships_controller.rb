class BreakshipsController < ApplicationController
  def create
    if logged_in?
      @user = User.find(params[:breakship][:breaked_id])
      current_user.break!(@user)
      redirect_to home_path
    end
  end

  def destroy
    @user = Breakship.find(params[:id]).breaked
    current_user.unbreak!(@user)
    redirect_to home_path
  end
end
