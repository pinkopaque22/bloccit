FactoryGirl.define do

require 'rails_helper'
require 'spec_helper'
require 'factory_girl_rails'
include  RandomData
   pw = RandomData.random_sentence

   factory :user do
     name RandomData.random_name
     sequence(:email){|n| "user#{n}@factory.com" }
     password pw
     password_confirmation pw
     role :member
   end
 end