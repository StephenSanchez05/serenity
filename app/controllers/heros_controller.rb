class HerosController < ApplicationController

    before_action :set_character

    def index
        @hero = Hero.all 
    end

    def new

        @hero = Hero.new
    end

    def create
        @hero = @character.heros.build(post_params)
        if @hero.save
            redirect_to '/characters/1/heros'
        else
            redirect_to '/characters'
        end

    end


    def post_params
        params.require(:hero).permit(:name, :character_id)
    end

    def set_character
        @character = Character.find(params[:character_id])
    end

end
