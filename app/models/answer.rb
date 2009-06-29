class Answer < ActiveRecord::Base
  validates_presence_of :abody
  belongs_to :question
end
