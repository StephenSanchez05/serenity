class CharactersController < ApplicationController

    def index
        @character = Character.all
        @user = User.all
    end
    
    def new
        @character = Character.new
    end

    def create
        @character = Character.create(post_params)
        redirect_to @character
    end

    def edit
    end

    def show
        @character = Character.find(params[:id])
    end


    private

    def post_params
        params.require(:character).permit(:name, :warrior, :level, :spells, :backstory, :user_id, :spell_ids[])
    end

    def auth
        request.env['omniauth.auth']
    end

end
