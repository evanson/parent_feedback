require "spec_helper"

describe SchoolDaysController do
  describe "routing" do

    it "routes to #index" do
      get("/school_days").should route_to("school_days#index")
    end

    it "routes to #new" do
      get("/school_days/new").should route_to("school_days#new")
    end

    it "routes to #show" do
      get("/school_days/1").should route_to("school_days#show", :id => "1")
    end

    it "routes to #edit" do
      get("/school_days/1/edit").should route_to("school_days#edit", :id => "1")
    end

    it "routes to #create" do
      post("/school_days").should route_to("school_days#create")
    end

    it "routes to #update" do
      put("/school_days/1").should route_to("school_days#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/school_days/1").should route_to("school_days#destroy", :id => "1")
    end

  end
end
