class Author < ActiveRecord::Base
  has_and_belongs_to_many :books

  validates_presence_of :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
end

