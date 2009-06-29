class Question < ActiveRecord::Base
  validates_presence_of :qbody
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true
  
  def next_id
      @next ||= self.class.find(:first,:select => ['id'],:conditions => ['id > ?', id], :order => 'id')
      @next ? @next.id : nil
    end

    def previous_id
      @previous ||= self.class.find(:first,:select => ['id'],:conditions => ['id < ?', id], :order => "id desc")
      @previous ? @previous.id : nil
    end
  
end
