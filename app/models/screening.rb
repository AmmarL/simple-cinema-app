class Screening < ActiveRecord::Base
  belongs_to :movie
  belongs_to :room
  accepts_nested_attributes_for :movie
  accepts_nested_attributes_for :room
  

end
