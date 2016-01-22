require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  let(:my_ad_id) do
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
      
      expect(assigns(:advertisements)).to eq([my_ad_id])
    end
  end
  describe "GET #show" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_ad_id}
      expect(response).to render_template :show
    end
    it "assigns my_ad to @advertisements" do
      get :show, {id: my_ad_id}
      expect(assigns(:advertisements)).to eq(my_ad_id)
    end
  end
end
