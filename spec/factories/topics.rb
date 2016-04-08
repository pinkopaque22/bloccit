require 'rails_helper'
require 'spec_helper'
require 'factory_girl_rails'
include RandomData
FactoryGirl.define do
   factory :topic do
     name RandomData.random_name
     description RandomData.random_sentence
   end
end


