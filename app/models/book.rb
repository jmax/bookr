class Book < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :authors

  def author_names
    authors.map(&:full_name).to_sentence
  end
end

