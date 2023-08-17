class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only:[:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end
    
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
            redirect_to user_path(@user)
        else
            flash[:error] = @user.errors.full_messages.join(' ')
            redirect_to edit_user_path
        end
        
    end

    def create
        @user = User.new(users_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Alpha Blog"
            redirect_to user_path(@user)
        else
            flash[:error] = @user.errors.full_messages.join(" ")
            redirect_to signup_path
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account and all associated articles successfully deleted"
        redirect_to articles_path
    end

    private
    def users_params
        params.require(:user).permit(:username, :email, :password, :avatar)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:notice] = "You can only edit or update your own account"
            redirect_to user_path(@user)
        end       
    end
end