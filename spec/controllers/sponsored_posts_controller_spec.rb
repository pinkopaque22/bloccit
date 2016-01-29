require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) {Topic.create!(name: RandomData.random_sentence,description: RandomData.random_paragraph)}
  let(:my_sponsored_post) { my_topic.my_sponsored_post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }
 

    describe "attributes" do
      it "should respond to title" do
        expect(my_sponsored_post).to respond_to(:title)
      end
      it "should respond to body" do
        expect(my_sponsored_post).to respond_to(:body)
      end
      it "should respond to price" do
        expect(my_sponsored_post).to respond_to(:price)
      end
    end
    
    describe "GET #show" do
       it "returns http success" do
        get :show, topic_id: my_topic.id, id: my_topic.my_sponsored_post.id
        expect(response).to have_http_status(:success)
       end
       it "renders the #show view" do
        get :show, topic_id: my_topic.id, id: my_topic.my_sponsored_post.id
        expect(response).to render_template :show
       end
       it "assigns my_sponsored_post to @my_sponsored_post" do
         get :show, {id: sponsored_post.id}
         expect(assigns(:post)).to eq(my_sponsored_post)
       end
    end
    
end
    