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
            create_session(@user)
            redirect_to root_path
        else flash.now[:alert] = "Error creating account, no worries just try again, we'll wait."
            render :new
        end
    end
    def show
     @user = User.find(params[:id])
    end
    def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.name).downcase
     "https://s-media-cache-ak0.pinimg.com/favicons/fe2172ad86a337a478ad3ad852faf809887f550cb63f7ff1bb2de5f9.png?
      4a1dbe3038214acc47b3bd3dddec2425
      /#{gravatar_id}.png?s=#{size}"
    end
end


