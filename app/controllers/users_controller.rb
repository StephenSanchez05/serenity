class UsersController < ApplicationController

    def index
      @user = User.find(session[:user_id])
    end

    def new
        @user = User.new
    end
  
      def create
         @user = User.find_by(name: params[:name])
         if @user
           redirect_to '/login'
         else
          @user = User.create(user_params)
           if @user.save
             session[:user_id] = @user.id
             redirect_to '/characters'
           else
           render :new
           end
        end
      end

    private
 
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    end  