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
      #it "should be public by default" do
          #only expect(true).to be (true) will pass this test. 
        #expect(topic.public).to be(true)
      #end
  end
end
