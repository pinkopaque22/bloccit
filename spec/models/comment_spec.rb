require 'rails_helper'
include RandomData
RSpec.describe Comment, type: :model do
    describe "attributes" do
        it { is_expected.to belong_to(:commentable) }
        it { is_expected.to belong_to(:user) }
        it { is_expected.to validate_presence_of(:body) }
        it { is_expected.to validate_length_of(:body).is_at_least(5) }
    end
end
