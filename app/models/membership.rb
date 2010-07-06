class Membership < ActiveRecord::Base
  validates_presence_of   :card_id, :first_name, :last_name
  validates_uniqueness_of :card_id

  def full_name
    "#{first_name} #{last_name}"
  end
end

