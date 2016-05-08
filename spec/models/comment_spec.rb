require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  #let(:commentable) { Comment.create!(body: 'Comment Body', commentable: comment, user: user) }
  let(:commentable) { Comment.create!(body: 'Comment Body', commentable: post, user: user) } 
 
        it { is_expected.to belong_to(:commentable) }
        it { is_expected.to belong_to(:user) }
        it { is_expected.to validate_presence_of(:body) }
        it { is_expected.to validate_length_of(:body).is_at_least(5) }
  
    describe "attributes" do
        it "should respond to body" do
            expect(commentable).to respond_to(:body)
        end
    end
end
