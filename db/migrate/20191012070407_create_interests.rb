class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.references :to, foreign_key: { to_table: :users }
      t.string :name
      t.string :email
      t.integer :phonenumber
      t.text :content

      t.timestamps
    end
  end
end
