class QuestionsController < ApplicationController
before_filter :require_admin, :except => [:index, :add_to_scorecard, :erase_answers, :welcome, :finish]


  def index
    @questions = Question.paginate :per_page => 1, :page => params[:page], :order => 'position'
    @scorecard = find_scorecard
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
      format.js
    end
  end
  
  def list
    @questions = Question.paginate :per_page => 5, :page => params[:page], :order => 'position'
    @scorecard = find_scorecard
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
      format.js
    end
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
    @question = Question.next(params[:id])
    render :nothing => true
  end
  
   
    
  
  def add_to_scorecard
    question = Question.find_by_position(params[:id])
    answer = Answer.find(params[:answer])
    @scorecard = find_scorecard 
   
    @scorecard.add_answer(answer)
    @scorecard.add_question(question)
     respond_to do |format|
       format.js
    end
 
  end
  
  
  def erase_answers
    session[:scorecard] = nil
    flash[:notice] = "your answer sheet is now blank"
    redirect_to :action => "welcome"
  end
  
  def welcome
    @question = Question.find_by_position(params[:id])
  end
  
  def finish
    @question = Question.find(:all)
    @scorecard = find_scorecard
    session[:scorecard] = nil
  end
  
  def sort
    params[:questions].each_with_index do |id, index|
      Question.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  
  
 
  
  


  
  private
  
  def find_question_id
    session[:scorecard]
  end
  
  def find_scorecard
    session[:scorecard] ||= Scorecard.new
  end

end
