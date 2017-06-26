class Ensemble < ApplicationRecord
  belongs_to :group, inverse_of: :ensembles
  belongs_to :individual, inverse_of: :ensembles

  validates :joining, presence: true
  validate :joining_before_leaving

  validates :individual_id, :uniqueness => { :scope => :group_id}

private
  def joining_before_leaving 
    if leaving != nil && joining !=nil   
      errors.add(:joining, " date must be prior to leaving date" )   unless joining <= leaving
    end
    else true
  end

end
