class SpellsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index        
        @user = User.find(session[:user_id])
    end
    
    def new
        @spells = Spell.new
    end

    def create
        @user = User.find(session[:user_id])
        @spells = Spell.create(post_params)
        if @spells.update(user_id: @user.id)
        redirect_to @spells
        else
            render :new
        end
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
        if !belong_to_user?
            redirect_to '/spells'
        end
    end

    def destroy
        Spell.find(params[:id]).destroy
        redirect_to '/spells'
    end

    private

    def post_params
        params.require(:spell).permit(:name, :description, :user_id)
    end

    def belong_to_user?
        @spells.user_id == session[:user_id]
    end
end
