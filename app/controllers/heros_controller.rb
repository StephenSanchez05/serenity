class HerosController < ApplicationController
    def index
        @hero = Hero.all 
    end
end
