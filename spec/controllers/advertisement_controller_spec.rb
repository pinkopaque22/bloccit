require 'rails_helper'
include RandomData

RSpec.describe AdvertisementController, type: :controller do
  let(:my_ad) do
    Advertisement.create(
      id: 1,
      title: RandomData.random_sentence,
      copy:  RandomData.random_paragraph,
      price: 99
    )
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns[my_ad] to @advertisements" do
      get :index
      
      expect(assigns(:advertisements)).to eq([my_ad])
    end
  end
end
