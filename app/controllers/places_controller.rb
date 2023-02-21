class PlacesController < ApplicationController

    def index
        @places = Place.all
    end

    def show
        @place = Place.find_by({ "id" => params["id"] })
        @posts = Post.where ({"place_id" => @place["id"] })
        #need to make sure I'm comfortable with why we need this. Why didn't we have something similar in web-apps-2?
    end    

    def new
        @place = Place.new
    end
    
    def create
        @place = Place.new
        @place["name"] = params["place"]["name"]
        @place.save
        redirect_to "/places"
    end

#Each controller action that does not render a view should redirect to somewhere else in the application, wherever it makes sense to go 

end
