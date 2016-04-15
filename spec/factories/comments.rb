
include RandomData
FactoryGirl.define do
    factory :comment do
    body RandomData.random_paragraph
    user
    commentable {create :post}
   end
 end