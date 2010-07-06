class Membership < ActiveRecord::Base
  validates_presence_of   :card_id, :first_name, :last_name
  validates_uniqueness_of :card_id

  has_many :loans
  has_many :books, :through => :loans, :conditions => ['loans.canceled = ?', false]

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.to_select
    all(:order => 'first_name, last_name').collect{|x| [x.full_name, x.id]}
  end
end

