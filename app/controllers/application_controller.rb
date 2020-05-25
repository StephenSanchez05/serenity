class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
        def redirect_if_not_logged_in
          if !logged_in?
            redirect_to root_path
          end
        end
        
        def logged_in?
          !!session[:user_id]
        end 
        
    
        def current_user
          User.find(session[:user_id])
      end


end
