class Venue < ApplicationRecord
  has_many :concerts, inverse_of: 'venue'
  accepts_nested_attributes_for :concerts 
  validates :name, presence: true, 
                    length: { maximum: 25 }
  validates :address, presence: true, 
                    length: { maximum: 25 }
  validates :city, presence: true, 
                    length: { maximum: 25 }
  validates :country, presence: true, 
                    length: { maximum: 25 }

end
