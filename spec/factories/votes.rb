require 'rails_helper'
require 'spec_helper'
require 'factory_girl_rails'
FactoryGirl.define do
   factory :votes do
    value
    user_id
    post_id
    #rank 0.0
   end
 end