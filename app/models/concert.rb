class Concert < ApplicationRecord
  has_and_belongs_to_many :artists
  accepts_nested_attributes_for :artists 

  has_many :setlists, dependent: :destroy
  has_many :songs, :through => :setlists
  accepts_nested_attributes_for :setlists
	
  validates :name, presence: true,
                    length: { minimum: 1, maximum: 25 }
  validates :date, presence: true
end
