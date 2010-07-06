class Loan < ActiveRecord::Base
  belongs_to :membership
  belongs_to :book

  validates_presence_of :membership, :book, :finished_on
end

