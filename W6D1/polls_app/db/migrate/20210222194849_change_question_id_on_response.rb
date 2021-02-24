class ChangeQuestionIdOnResponse < ActiveRecord::Migration[5.2]
  def change
    rename_column :responses, :question_id, :user_id
  end
end
