# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :authored_polls,
        foreign_key: :author_id,
        class_name: :Poll

    has_many :responses,
        foreign_key: :user_id,
        class_name: :Response
end
