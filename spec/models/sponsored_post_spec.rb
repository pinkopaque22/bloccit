require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
let(:sponsored_post) { SponsoredPost.create!(title: "New Sponsored Post Title", body: "New Sponsored Post Body", price: 599) }
let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


it { is_expected.to belong_to(:topic) }

   describe "attributes" do
     it "responds to title" do
       expect(sponsored_post).to respond_to(:title)
     end
     it "responds to body" do
       expect(sponsored_post).to respond_to(:body)
     end
     it "responds to price" do
         expect(sponsored_post).to respond_to(:price)
     end
   end
end


