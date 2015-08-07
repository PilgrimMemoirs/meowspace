class CreateCats < ActiveRecord::Migration
  # def change
  # end

  def up #creates the table
    create_table :cats do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :age
      t.string  :breed
      t.text    :bio
      t.boolean :private
      t.boolean :admin

      t.string  :username, unique: true
      t.string  :password
      t.timestamps
    end
  end

  def down #'drops'/deletes the table
    drop_table :cats
  end
end
