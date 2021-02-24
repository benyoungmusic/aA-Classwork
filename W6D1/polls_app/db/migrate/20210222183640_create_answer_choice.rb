class CreateAnswerChoice < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.integer :parent_question_id, null: false
      t.text :answer_text

      t.timestamps
    end

    add_index :answer_choices, :parent_question_id, unique: true
  end
end
