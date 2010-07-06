class Book < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :tags
  has_many :loans
  has_many :memberships, :through => :loans

  def self.to_select
    all(:order => 'title').collect{|x| [x.title, x.id]}
  end

  def author_names
    authors.map(&:last_name).to_sentence
  end

  def tag_names
    tags.map(&:name).to_sentence
  end
end

