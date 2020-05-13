class SpellsController < ApplicationController

    def index
        @user = User.find(session[:user_id])
    end
    
    def new
        @spells = Spell.new
    end

    def create
        @user = User.find(session[:user_id])
        @spells = Spell.create(post_params)
        @spells.update(user_id: @user.id)
        redirect_to @spells
    end

    def edit
        @spells = Spell.find(params[:id])
    end

    def update
        @spells = Spell.find(params[:id])
        if @spell.update(spell)
            redirect_to @spell
        else
            render :edit
        end
    end

    def show
        @spells = Spell.find(params[:id])
    end

    def destroy
        @spell = Spell.find(params[:id])
        @spell.destroy
        redirect_to '/spells'
    end

    private

    def post_params
        params.require(:spell).permit(:name, :description, :user_id)
    end
end
