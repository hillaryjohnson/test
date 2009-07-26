class Scorecard 

attr_reader :items
attr_reader :answered_questions

  
  def points
    @points or '0'
  end
  
  
  
  def initialize
    @items = []
    @answered_questions = []

  end
  
  def add_answer(answer)
    @items << answer
  end
  
  def add_question(question)
    @answered_questions << question
  end
  
  def score
   @items.sum { |item| item.points }
  end
    
end