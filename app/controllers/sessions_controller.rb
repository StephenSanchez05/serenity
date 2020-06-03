class SessionsController < ApplicationController

  require 'securerandom'

    def new
      @user = User.new
    end
    
    def fb
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
          u.password = SecureRandom.alphanumeric(10)
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