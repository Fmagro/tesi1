class Individual < Performer
  has_many :ensembles, dependent: :destroy, inverse_of: :individual
  
  has_many :groups, :through => :ensembles
end
