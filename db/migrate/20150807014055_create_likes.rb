class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :cat
      t.belongs_to :meow

      t.timestamps
    end
  end
end
