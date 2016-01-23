require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
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
  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end
    it "assigns my_ad to @advertisements" do
      get :show, {id: my_ad.id}
      expect(assigns(:advertisements)).to eq(my_ad)
    end
  end
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    it "instantiates @advertisements" do
      get :new
      expect(assigns(:advertisements)).not_to be_nil
     end
  end
  describe "Post create" do
    it "increases the number of advertisements by 1" do
      post :create, advertisements: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      change(Advertisement, :count).by(1)
    end
    it "assigns the new advertisement to @advertisements" do
      post :create, advertisements: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(assigns(:advertisements)).to eq Advertisement.last
    end
    it "redirects to the new advertisement" do
      post :create, advertisements: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(response).to redirect_to Advertisement.last
    end
  end  
end
