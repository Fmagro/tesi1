class Setlist < ApplicationRecord
  belongs_to :concert
  belongs_to :song
  validates_numericality_of :position, only_integer:true, message: 'can only be a whole number', allow_nil: false

end
