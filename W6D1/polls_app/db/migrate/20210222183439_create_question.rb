class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :parent_poll_id, null: false
      t.text :text

      t.timestamps
    end

    add_index :questions, :parent_poll_id, unique: true
  end
end
