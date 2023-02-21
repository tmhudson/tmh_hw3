class PostsController < ApplicationController

    def new
        @post = Post.new
        @place = Place.find_by({"id" => params["place_id"]})
        @post["place_id"] = @place["id"]
    end
    
    def create
        @post = Post.new
        @post["title"] = params["post"]["title"]
        @post["place_id"] = params["post"]["place_id"]
        @post["long_description"] = params["post"]["long_description"]
        @post["posted_on"] = params["post"]["posted_on"]
        @post.save
        redirect_to "/places/#{@post["place_id"]}"
    end

    #Each controller action that does not render a view should redirect to somewhere else in the application, wherever it makes sense to go 
end
