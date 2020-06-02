class SessionsController < ApplicationController

    def new
      @user = User.new
    end
    
    def omni
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end   
        session[:user_id] = @user.id   
        render 'characters/index'
      end

    def create
      @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])    
          session[:user_id] = @user.id       
          render 'characters/index'
        else
         redirect_to 'welcome/home'
        end
    end



    def destroy
      session.delete("user_id")
      redirect_to root_path
    end
   
    private
   
    def auth
      request.env['omniauth.auth']
    end
  end