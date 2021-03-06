class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @places = Place.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.email = params[:user][:email]
        @user.picture = params[:user][:picture]
        @user.save
        redirect_to '/users'
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.email = params[:user][:email]
        @user.picture = params[:user][:picture]
        @user.save
        redirect_to '/users'
    end
    
    def delete
    end
    
    def add_place
        user_place = UserPlace.find_by(
            user_id: params[:user_id],
            place_id: params[:place_id]
        )
        if user_place == nil
            user = User.find(params[:user_id])
            user_place = UserPlace.new
            user_place.user_id = params[:user_id]
            user_place.place_id = params[:place_id]
            user_place.save
        end
        redirect_to user_path(user)
    end
    
    def delete_place
        user_place = UserPlace.find(params[:id])
        user_place.destroy
        redirect_to '/users'
    end
end
