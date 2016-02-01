require 'rails_helper'
include RandomData
RSpec.describe SponsoredPostsController, type: :controller do
let(:sponsored_post) { SponsoredPost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
let(:topic) {Topic.create!(name: RandomData.random_sentence ) }
       
    describe "GET show" do
        it "returns http success" do
            get :show, {id: sponsored_post.id, topic_id: topic.id}
            expect(response).to have_http_status(:success)
        end
        it "renders the #show view" do
            get :show, {id: sponsored_post.id, topic_id: topic.id}
            expect(response).to render_template :show
        end
        it "assigns sponsored_post to @sponsored_post" do
            get :show, {id: sponsored_post.id, topic_id: topic.id}
            expect(assigns(:sponsored_post)).to eq(sponsored_post)
        end
    end
    describe "GET new" do
        it "returns http success" do
            get :new, {id: sponsored_post.id, topic_id: topic.id}
            expect(response).to have_http_status(:success)
        end
        it "renders the #new view" do
            get :new, {id: sponsored_post.id, topic_id: topic.id}
            expect(response).to render_template :new
        end
        it "initializes @sponsored_post" do
            get :new, {id: sponsored_post.id, topic_id: topic.id}
            expect(assigns(:sponsored_post)).not_to be_nil
        end
    end
    describe "GET edit" do
        it "returns http success" do
            get :edit, {id: sponsored_post.id, topic_id: topic.id}
            expect(response).to have_http_status(:success)
        end
        it "renders the #edit view" do
            get :edit, {id: sponsored_post.id, topic_id: topic.id}
            expect(response).to render_template :edit
        end
        it "assigns sponsored_post to be updated to @sponsored_post" do
            get :edit, {id: sponsored_post.id, topic_id: topic.id}
            sponsored_post_instance = assigns(:sponsored_post)
 
            expect(sponsored_post.id).to eq sponsored_post.id
            expect(sponsored_post.title).to eq sponsored_post.title
            expect(sponsored_post_instance.body).to eq sponsored_post.body
        end
    end
end



