class HabtmAuthorsBooks < ActiveRecord::Migration
  def self.up
    create_table :authors_books, :id => false do |t|
      t.belongs_to :author
      t.belongs_to :book
    end
  end

  def self.down
    drop_table :authors_books
  end
end

