class Song < ApplicationRecord
  has_many :setlists, inverse_of: :song, dependent: :destroy
  has_many :concerts, :through => :setlists
  has_and_belongs_to_many :artists 
  def self.all_genres; %w[pop rock metal classical jazz alternative hiphop blues country lyrical]; end
 
  validates :title, presence: true, 
             length: {maximum: 25 }
  validates :genre, inclusion: { in:  Song.all_genres }

  scope :by_title, -> (title_s) { where("title = ?", title_s) if title_s.present? }
  scope :by_genre, -> (genre_s) { where("genre = ?", genre_s) if genre_s.present? }
  #scope :by_artist, -> (artist_s) { joins(:artists).where("name= ?", artist_s) if artist_s.present? }
  scope :by_artist, -> (artist_s) { where("name= ?", artist_s) if artist_s.present? }
end

