class Scorecard

attr_reader :items
  
  def points
    @points or '0'
  end
  
  def initialize
    @items = []
  end
  
  def add_answer(answer)
    @items << answer
  end
  
  def score
   @items.sum { |item| item.points }
  end
    
end