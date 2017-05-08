class Setlist < ApplicationRecord
  belongs_to :concert, inverse_of: :setlists
  belongs_to :song, inverse_of: :setlists
  validates_numericality_of :position, only_integer:true, message: 'can only be a whole number', allow_nil: false

end
