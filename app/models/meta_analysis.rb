class MetaAnalysis < ActiveRecord::Base
  has_many :meta_analysis_treatments
  has_many :treatments, through: :meta_analysis_treatments

  validates :description, presence: true, uniqueness: true
end
