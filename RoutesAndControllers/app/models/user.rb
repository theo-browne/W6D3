# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#

class User < ApplicationRecord
  validates :username, presence: true 


  has_many :artwork_views,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :shared_artworks,
    through: :artwork_views,
    source: :artwork
end
