class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.belongs_to :membership
      t.belongs_to :book
      t.date :started_on
      t.date :finished_on
      t.boolean :canceled, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end

