class WelcomeController < ApplicationController
    def home
      #if session[:user_id] 
       #redirect_to '/characters'
      #end
    end


    private

    def auth
      request.env['omniauth.auth']
    end
  end