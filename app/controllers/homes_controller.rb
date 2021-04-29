class HomesController < ApplicationController

def index
    @users = User.all.where.not(sexe: current_user.sexe)
    render json: @users
end
end
