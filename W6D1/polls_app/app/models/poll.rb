# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Poll < ApplicationRecord
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
    
    has_many :questions,
        foreign_key: :parent_poll_id,
        class_name: :Poll
    

end
