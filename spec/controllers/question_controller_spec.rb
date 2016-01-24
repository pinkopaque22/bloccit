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
  describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #edit view"do
       get :edit, {id: my_question.id}
       expect(response).to render_template :edit
     end
  end
  describe "PUT update" do
    it "updates question with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      
      put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false}
      
      updated_question = assigns(:question)
      expect(updated_question.id).to eq my_question.id
      expect(updated_question.id).to eq new_title
      expect(updated_question.id).to eq new_body
    end
    it "redirects to the updated question" do
      new_title = RandomData.random_sentence
      new_body  = RandomData.random_paragraph
     
     put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: true} 
     expect(response).to redirect_to my_question
   end
  end
  describe "DELETE destroy" do
    it "deletes the question" do
      delete :destroy, {id: my_question.id}
      count = Question.where({id: my_question.id}).size
      expect(count).to eq 0
    end
    it "redirects to the question index" do
      delete :destroy, {id: my_question.id}
      expect(response).to redirect_to questions_path
    end
  end    
end

