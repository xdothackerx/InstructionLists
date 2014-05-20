class Step < ActiveRecord::Base
  belongs_to :list
  validates_length_of :info, :minimum =>1
end
