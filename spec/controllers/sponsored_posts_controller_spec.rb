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
    describe "POST create" do
        it "increases the number of SponsoredPosts by 1" do
            expect{ sponsored_post :create, {sponsored_post_instance: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}}.to change(SponsoredPost,:count).by(1)
        end
        it "assigns SponsoredPost.last to @sponsored_post" do
            sponsored_post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
            expect(assigns(:sponsored_post)).to eq SponsoredPost.last
        end
        it "redirects to the new sponsored post" do
            sponsored_post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
            expect(response).to redirect_to SponsoredPost.last
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
    describe "PUT update" do
        it "updates Sponsored Post with expected attributes" do
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph
 
            put :update, id: sponsored_post.id, sponsored_post: { title: new_title, body: new_body }
 
            updated_sponsored_post = assigns(:sponsored_post)
            expect(updated_sponsored_post.id).to eq sponsored_post.id
            expect(updated_sponsored_post.title).to eq new_title
            expect(updated_sponsored_post.body).to eq new_body
            end
        it "redirects to the updated sponsored post" do
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph
 
            put :update, id: sponsored_post.id, sponsored_post: { title: new_title, body: new_body }
            expect(response).to redirect_to sponsored_post
        end
    end
    describe "DELETE destroy" do
        it "deletes the sponsored post" do
            delete :destroy, {id: sponsored_post.id}
            count = SponsoredPost.where({id: sponsored_post.id}).size
            expect(count).to eq 0
        end
        it "redirects to sponsored post topic" do
            delete :destroy, {id: sponsored_post.id}
            expect(response).to redirect_to topic_sponsored_post_path
        end
    end
end



