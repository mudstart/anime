require "spec_helper"

describe AnimeShowsController do
  describe "routing" do

    it "routes to #index" do
      get("/anime_shows").should route_to("anime_shows#index")
    end

    it "routes to #new" do
      get("/anime_shows/new").should route_to("anime_shows#new")
    end

    it "routes to #show" do
      get("/anime_shows/1").should route_to("anime_shows#show", :id => "1")
    end

    it "routes to #edit" do
      get("/anime_shows/1/edit").should route_to("anime_shows#edit", :id => "1")
    end

    it "routes to #create" do
      post("/anime_shows").should route_to("anime_shows#create")
    end

    it "routes to #update" do
      put("/anime_shows/1").should route_to("anime_shows#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/anime_shows/1").should route_to("anime_shows#destroy", :id => "1")
    end

  end
end
