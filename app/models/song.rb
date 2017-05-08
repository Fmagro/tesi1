class Song < ApplicationRecord
  has_many :setlists, inverse_of: :song, dependent: :destroy
  has_many :concerts, :through => :setlists
  has_and_belongs_to_many :artists 
  def self.all_genres; %w[pop rock metal classical jazz alternative hiphop blues country lyrical]; end
 
  validates :title, presence: true, uniqueness: true,
             length: {maximum: 25 }
  validates :genre, inclusion: { in:  Song.all_genres }
end
