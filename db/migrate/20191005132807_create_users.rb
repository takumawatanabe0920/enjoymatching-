class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.integer :user_type

      t.timestamps
    end
  end
end
