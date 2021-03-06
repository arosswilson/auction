class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, uniqueness: true
      t.string :password, null: false, minimum: 6

      t.timestamps
    end
  end
end
