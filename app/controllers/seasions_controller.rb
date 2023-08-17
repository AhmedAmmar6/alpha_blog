class SeasionsController < ApplicationController
    def new
        
    end
    def create
        user = User.find_by(email: params[:seasion][:email].downcase)
        if user && user.authenticate(params[:seasion][:password])
          session[:user_id] = user.id
          redirect_to user, notice: "Logged in successfully"
        else
          flash[:error] = "There is something wrong with your login details"
          redirect_to login_path
        end
      end
      
      def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out successfully"
      end
      
end