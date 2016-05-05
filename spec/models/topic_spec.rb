require 'rails_helper'
include RandomData
RSpec.describe Topic, type: :model do
  
   let(:topic) { create(:topic) }
  
      it { is_expected.to have_many(:posts) }
      it { is_expected.to have_many(:labelings) }
      it { is_expected.to have_many(:labels).through(:labelings) }

  context "attributes" do
      it "should respond to name" do
        expect(topic).to respond_to(:name)
      end
      it "should respond to description" do
        expect(topic).to respond_to(:description)
      end
      it "should respond to public" do
        expect(topic).to respond_to(:public)
      end
      # it "should be public by default" do
      #   only expect(true).to be (true) will pass this test. 
      #   expect(topic.public).to be(true)
      # end
  end
     describe "scopes" do
       before do
         @public_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
         @private_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph, public: false)
       end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = User.new
         expect(Topic.visible_to(user)).to eq(Topic.all)
       end
 
       it "returns only public topics if user is nil" do
         expect(Topic.visible_to(nil)).to eq([@public_topic])
       end
     end
     end
end
