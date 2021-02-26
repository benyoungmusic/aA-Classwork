require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ['golden', 'black', 'grey', 'tabby', 'orange', 'calico']
    validates :color, inclusion: { in: COLORS,
        message: "%{value} is not a valid color"}
    validates :sex, inclusion: { in: %w(M F),
        message: "%{value} is not a valid sex, please enter M or F"}
    validates :birth_date, :color, :name, :sex, presence: true


    def age
        time_ago_in_words(self.birth_date)
    end
end
