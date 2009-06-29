class QuestionsController < ApplicationController
before_filter :require_admin, :except => [:show, :add_to_scorecard, :erase_answers, :welcome, :finish]

  def index
    @questions = Question.paginate :per_page => 1, :page => params[:page], :order => 'created_at DESC'
    @scorecard = find_scorecard
  end
  
  def show
    @question = Question.find(params[:id])
    @scorecard = find_scorecard
  end
  
  def new
    @question = Question.new
    4.times { @question.answers.build }
  end
  
  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Successfully created question."
      redirect_to @question
    else
      render :action => 'new'
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:notice] = "Successfully updated question."
      redirect_to @question
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Successfully destroyed question."
    redirect_to questions_url
  end
  
   def next
    @question = Question.find(params[:id])
    @next_question = Question.next(@question)

  end
  
  def add_to_scorecard
    answer = Answer.find(params[:answer])
    @scorecard = find_scorecard
    @scorecard.add_answer(answer)
    respond_to do |format|
      format.js
    end
  end
  
    def erase_answers
    session[:scorecard] = nil
    flash[:notice] = "your answer sheet is now blank"
    redirect_to :action => "welcome"
    #TODO fix redirect
  end
  
  def welcome
    @question = Question.find(:first)
  end
  
  def finish
    @question = Question.find(:all)
    @scorecard = find_scorecard
    session[:scorecard] = nil
  end
  
 
  
  


  
  private
  
  def find_scorecard
    session[:scorecard] ||= Scorecard.new
  end
end
