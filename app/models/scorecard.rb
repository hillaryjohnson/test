class Scorecard < ActiveRecord::Base

def 
  self.columns() @columns ||= [];
end
def 
  self.column(name, sql_type = nil, default = nil, null = true)
  columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
end

column :item, :string
column :answered_question, :string

attr_reader :items, :answered_questions
 
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