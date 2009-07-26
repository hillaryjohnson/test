module QuestionsHelper
  
  def unique_question?
    @unique_question != @Questions.find_by_id(session[:params])
  end

end
