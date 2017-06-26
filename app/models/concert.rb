class Concert < ApplicationRecord
  has_and_belongs_to_many :performers
  accepts_nested_attributes_for :performers 

  has_many :setlists, inverse_of: :concert,      dependent: :destroy
  has_many :songs, :through => :setlists
  accepts_nested_attributes_for :setlists

  belongs_to :venue, inverse_of: 'concerts', foreign_key: 'venue_id'
  accepts_nested_attributes_for :venue 

	
  validates :name, presence: true,
                    length: { minimum: 1, maximum: 25 }
  validates :date, presence: true

  scope :by_venue, -> (venue_s) { where('venuename = ?', venue_s) if venue_s.present? }

  scope :by_city, -> (city_s) { where('city = ?', city_s) if city_s.present? }

  scope :by_country, -> (country_s) { where('country = ?', country_s) if country_s.present? }

  scope :by_performer, -> (performer_s) { where('pname = ?', performer_s) if performer_s.present? }

  scope :after, -> (a_date) { where('date >= ?', Date.parse(a_date)) if a_date.present? }

  scope :before, -> (b_date) { where('date <= ?', Date.parse(b_date)) if b_date.present? }

  def conc(c_id)
    Concert.find(c_id)
  end
  #scope :venuej, {joins(:venue).select("concerts.*, venues.*, venue.name as venuename")}
  
    #scope :artistj, joins(:artists).select("artist.*, artist.name as artistname")
end
