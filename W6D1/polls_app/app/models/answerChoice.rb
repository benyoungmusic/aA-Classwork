# == Schema Information
#
# Table name: answer_choices
#
#  id                 :bigint           not null, primary key
#  parent_question_id :integer          not null
#  answer_text        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class AnswerChoice < ApplicationRecord
    belongs_to :question,
        foreign_key: :parent_question_id,
        class_name: :Question
end
