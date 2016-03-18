FactoryGirl.define do
  include RandomData
   factory :labels do
     name RandomData.random_sentence
   end
 end