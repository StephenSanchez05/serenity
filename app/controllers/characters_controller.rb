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
        @character = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])
        if @character.update(post_params)
            redirect_to @character
        else
            render :edit
        end
    end

    def show
        @character = Character.find(params[:id])
        @user = User.find(session[:user_id])
        if !belong_to_user?
            redirect_to '/characters'
        end
    end

    def destroy
        Character.find(params[:id]).destroy
        redirect_to '/characters'
    end


    private

    def post_params
        params.require(:character).permit(:name, :warrior, :level, :backstory, :user_id, spell_ids:[])
    end

    def belong_to_user?
        @character.user_id == session[:user_id]
    end

end
