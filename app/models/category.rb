class Category < ActiveRecord::Base
  has_many :books

  def self.to_select
    all(:order => :name).map{|b| [b.name, b.id]}
  end
end

