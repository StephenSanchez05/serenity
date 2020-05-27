class UsersController < ApplicationController

    def new
        @user = User.new
    end
  
      def create
        @user = User.create(user_params)
        if @user.save
        session[:user_id] = @user.id
        redirect_to '/characters'
        else
        render :new
        end
      end

      def login
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])    
        session[:user_id] = user.id       
        redirect_to controller: 'character', action: 'index'
        else
          redirect_to '/new'
        end
      end

    private
 
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    end  