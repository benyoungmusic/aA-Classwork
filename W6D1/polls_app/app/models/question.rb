# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  parent_poll_id :integer          not null
#  text           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Question < ApplicationRecord

    belongs_to :poll,
        foreign_key: :parent_poll_id,
        class_name: :Poll

    has_many :answer_choices,
        foreign_key: :parent_question_id,
        class_name: :AnswerChoice
end
