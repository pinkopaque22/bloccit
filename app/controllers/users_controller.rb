class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        
        if @user.save
            flash[:notice] = "Welcome to Bloccit by COF #{@user.name}!"
            redirect_to root_path
        else flash.now[:alert] = "Error creating account, no worries just try again, we'll wait."
            render :new
        end
    end
end
