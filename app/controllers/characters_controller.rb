class CharactersController < ApplicationController

    def index
    end
    
    def new
        @character = Character.new
    end

    def create
        character = Character.create(post_params)
        redirect_to character
    end

    def edit
    end

    def show
    end


    private

    def post_params
        params.require(:name, :warrior, :level).permit(:spell, :backstory, spell_ids:[])
    end

end
