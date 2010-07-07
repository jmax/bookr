class CreatePacks < ActiveRecord::Migration
  def self.up
    create_table :packs do |t|
      t.string :name
      t.text :description
      t.date :finished_on

      t.timestamps
    end
  end

  def self.down
    drop_table :packs
  end
end
