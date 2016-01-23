require 'rails_helper'
include RandomData

RSpec.describe QuestionController, type: :controller do
let(:my_question) do
    Question.create(
     id: 1,
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     resolved: false
     )
end
  describe "GET index" do
    it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
    end
    it "assigns my_question to @question" do
       get :index
      expect(assigns(:question)).to eq([my_question])
    end
  end
  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
       get :show, {id: my_question.id}
       expect(response).to render_template :show
    end
    it "assigns my_question to @question" do
      get :show, {id: my_question.id}
      expect(assigns(:question)).to eq(my_question)
    end
  end
  describe "GET new" do
    it "returns http success" do
      get :show, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end 
    it "renders the #new view" do
       get :new, {id: my_question.id}
       expect(response).to render_template :new
     end
     it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
     end
  end
  describe "POST create" do
     it "increases the number of Questions by 1" do
       expect {post :create, {question: {title: "Title", body: "Body", resolved: "false"}}}.to change(Question, :count).by(1)
     end
     it "assigns the new question to @question" do
       post :create, {question: my_question.attributes}
       expect(assigns(:question)).to eq Question.last
     end
     it "redirects to the new question" do
       post :create, {question: my_question.attributes}
       expect(assigns(:question)).to eq Question.last
     end
       
    
  end
      
end

