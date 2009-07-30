class Question < ActiveRecord::Base
  acts_as_list :order => :position
  validates_presence_of :body
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true
  
  attr_reader :scorecard
  
  def next_id
    @next ||= self.class.find(:first,:select => ['id'],:conditions => ['id > ?', id], :order => 'id')
    @next ? @next.id : nil
  end

  def previous_id
    @previous ||= self.class.find(:first,:select => ['id'],:conditions => ['id < ?', id], :order => "id desc")
    @previous ? @previous.id : nil
  end
  
  def next_by_position
    @next ||= self.class.find(:first,:select => ['position'],:conditions => ['position > ?', position], :order => 'position')
    @next ? @next.id : nil
  end
    
    
    
    
  
end
