require 'rails_helper'
require 'spec_helper'
require 'factory_girl_rails'
include RandomData

FactoryGirl.define do
  
    factory :comments do
    body RandomData.random_paragraph
    #user_id 
   end
 end