class Band < ApplicationRecord
  belongs_to :individual, class_name: "Artist",    inverse_of: :bands
  belongs_to :group, class_name: "Artist", inverse_of: :bands
  validates :joining, presence: true
  validate :joining_before_leaving

private
  def joining_before_leaving 
    if leaving != nil && joining !=nil   
      errors.add(:joining, " date must be prior to leaving date" )   unless joining <= leaving
    end
    else true
    end
end
