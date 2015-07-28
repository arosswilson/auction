class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount, null: false
      t.references :user
      t.references :item

      t.timestamps
    end
  end
end
