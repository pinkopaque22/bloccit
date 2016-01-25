class QuestionsController < ApplicationController
   def index
     @questions = Question.all
   end
  
   def show
     @question = Question.find(params[:id])
   end

   def new
     @question = Question.new
   end
   
   def create
     @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
      if @question.save
        flash[:notice] = "Your Question was saved"
        redirect_to @question
      else
        flash[:error] = "Your question was not saved. Please try again"
        render :new
      end
   end
  
   def edit
     @question = Question.find(params[:id])
   end

   def update
     @question = Question.find(params[:id])
      if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
        flash[:notice] = "Your Question was updated"
        redirect_to @question
      else
        flash[:error] = "Your question was not saved. Please try again"
        render :edit
      end
   end
   
   def destroy
     @question = Question.find(params[:id])
      if @question.destroy 
       flash[:notice] = "\"#{@question.title}\"was certainly deleted sucessfully"
       redirect_to action:"index"
      else 
       flash[:error] = "Your question was not deleted. Please try again"
       render :show
      end
   end
end

  
 

