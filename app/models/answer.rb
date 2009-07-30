class Answer < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :question
end
