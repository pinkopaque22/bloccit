require 'rails_helper'
include RandomData
RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  
      it { should have_many(:posts) }
      it { is_expected.to belong_to(:topic) }
      
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:body) }
      it { is_expected.to validate_presence_of(:topic) }
   
      it { is_expected.to validate_length_of(:title).is_at_least(5) }
      it { is_expected.to validate_length_of(:body).is_at_least(15) }
     
    describe "attributes" do
      it "should respond to name" do
        expect(topic).to respond_to(:name)
      end
      it "should respond to description" do
        expect(topic).to respond_to(:description)
      end
      it "should respond to public" do
        expect(topic).to respond_to(:public)
      end
      
      #it "should be public by default" do
        #only expect (true).to be (true) #will pass this test. 
        #expect(topic.public).to be(true)
      #end
    end
  end
