class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user
      t.string :title, null: false
      t.text :description
      t.datetime :start
      t.datetime :stop

      t.timestamps
    end
  end
end
