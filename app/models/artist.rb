class Artist < ApplicationRecord
  has_and_belongs_to_many :songs 
  accepts_nested_attributes_for :songs
  validates :name, presence: true, uniqueness: true,
                    length: { minimum: 1, maximum: 25 }


end
