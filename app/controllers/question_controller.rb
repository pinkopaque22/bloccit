class QuestionController < ApplicationController
   def index
     @question = Question.all
   end
  
   def show
     @question = Question.find(params[:id])
   end

   def new
   end
  
   def edit
   end

  #def create
  #end

  #def update
  #end

  

  #def destroy
  #end

  
 
end
