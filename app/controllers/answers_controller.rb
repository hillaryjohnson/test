class AnswersController < ApplicationController
  before_filter :require_admin
  before_filter :load_question
  
  def load_question
    @question = Question.find(params[:question_id])
  end
  def index
    @answers = @question.answers.all
  end
  
  def show
    @answer = @question.answers.find(params[:id])
  end
  
  def new
    @answer = @question.answers.build
  end
  
  def create
    @answer = @question.answers.create!(params[:answer])
    if @answer.save
      flash[:notice] = "Successfully created answer."
      redirect_to @answer
    else
      render :action => 'new'
    end
  end
  
  def edit
    @answer = @question.answer.find(params[:id])
  end
  
  def update
    @answer = @question.answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      flash[:notice] = "Successfully updated answer."
      redirect_to @question
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @answer = @question.answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Successfully destroyed answer."
    redirect_to answers_url
  end
end
