class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :ammount, null: false
      t.references :user
      t.references :item

      t.timestamps null: false
    end
  end
end
