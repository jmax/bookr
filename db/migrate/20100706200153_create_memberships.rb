class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.string :card_id
      t.string :first_name
      t.string :last_name
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end

