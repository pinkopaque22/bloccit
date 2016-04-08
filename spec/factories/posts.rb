require 'rails_helper'
require 'spec_helper'
require 'factory_girl_rails'
include RandomData
FactoryGirl.define do
   factory :post do
     title RandomData.random_sentence
     body RandomData.random_paragraph
     topic
     user
     rank 0.0
   end
end
