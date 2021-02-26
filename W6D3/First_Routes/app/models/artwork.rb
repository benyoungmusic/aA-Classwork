class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, presence: true, uniqueness: true

     belongs_to :artist,
    foreign_key: :artist_id,
    class_name: "User"

    has_many :artwork_share,
    foreign_key: :artwork_id,
    class_name: "ArtworkShare"

    has_many :shared_viewers,
    through: :artwork_share,
    source: :viewer

    


end
