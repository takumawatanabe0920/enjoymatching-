class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email
      t.integer :phonenumber
      t.text :content

      t.timestamps
    end
  end
end
