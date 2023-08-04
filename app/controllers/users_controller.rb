class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(users_params)
            flash[:notice] = "Your profile is updated Successfully"
            redirect_to articles_path
        else
            flash[:error] = @user.errors.full_messages.join(' ')
            redirect_to edit_user_path
        end
        
    end

    def create
        @user = User.new(users_params)
        if @user.save
            flash[:notice] = "Welcome to Alpha Blog"
            redirect_to articles_path
        else
            flash[:error] = @user.errors.full_messages.join(" ")
            redirect_to signup_path
        end
    end

    private
    def users_params
        params.require(:user).permit(:username, :email, :password)
    end
end