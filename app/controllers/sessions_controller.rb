class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            create_session(user)
            flash[:notice] = "Welcome to Bloccit, #{user.name}!"
            redirect_to root_path
        else
            flash.now[:alert] = 'Invalid email/password combination'
            render :new
        end
    end
    def new
    end
    def destroy
        destroy_session(current_user)
            flash[:notice] = "You've been signed out, see you next time!"
            redirect_to root_path
    end
end
