class QuestionController < ApplicationController
   def index
     @question = Question.all
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
        redirect_to@question
      else
        flash[:error] = "Your question was not saved. Please try again"
        render :new
      end
   end
  
   def edit
   end

  

  #def update
  #end

  

  #def destroy
  #end

  
 
end
