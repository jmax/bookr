class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.belongs_to :category
      t.string :title
      t.text :abstract
      t.text :description
      t.integer :volumes
      t.date :published_on

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end

