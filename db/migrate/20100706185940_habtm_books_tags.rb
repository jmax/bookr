class HabtmBooksTags < ActiveRecord::Migration
  def self.up
    create_table :books_tags, :id => false do |t|
      t.belongs_to :book
      t.belongs_to :tag
    end
  end

  def self.down
    drop_table :books_tags
  end
end

