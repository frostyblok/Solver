class QuestionsController < ApplicationController
  def create 
    Question.create(question_params)
    redirect_to root_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc).all
  end
  private
  def question_params
    params.require(:question).permit(:email, :body)
  end
  
end