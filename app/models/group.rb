class Group < Performer
  has_many :ensembles, dependent: :destroy, inverse_of: :group
  
  has_many :individuals, :through => :ensembles
  accepts_nested_attributes_for :ensembles

end
