class CharactersController < ApplicationController

    def index
        @user = User.find(session[:user_id])
    end
    
    def new
        @character = Character.new
    end

    def create
        @user = User.find(session[:user_id])
        @character = Character.create(post_params)
        @character.update(user_id: @user.id)
        redirect_to @character
    end

    def edit
    end

    def show
        @character = Character.find(params[:id])
        @user = User.find(session[:user_id])
    end


    private

    def post_params
        params.require(:character).permit(:name, :warrior, :level, :spells, :backstory, :user_id)
    end

end
