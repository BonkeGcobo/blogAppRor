require 'rails_helper'

RSpec.describe "Users, type::request" do
    describe "Testing user/:id/post" do
        it "Test Success" do
            get '/users/4/posts'
            expect(response.status).to eq(200)
        end

        it "Test that the correct template rendered" do
            get '/users/4/posts'
            expect(response.body).to include("Posts belonging to a user")
        end
    end


    describe "Testing user/:id/posts/:id" do
        it "Test if the request is successful" do
            get '/users/4/posts/7'
            expect(response.status).to eq(200)
        end

        it "Test if the correct template is being shown" do
            parameter = 4
            get "/users/1/posts/#{parameter}"
            expect(response.body).to include("Post with id: #{parameter}")
        end
    end
end