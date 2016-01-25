require 'rails_helper'
include RandomData

RSpec.describe TopicsController, type: :controller do
let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
 
    describe "GET index" do
      it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
      end
      it "assigns my_topic to @topics" do
       get :index
       expect(assigns(:topics)).to eq([my_topic])
      end
    end
end
