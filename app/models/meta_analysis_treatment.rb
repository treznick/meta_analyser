class MetaAnalysisTreatment < ActiveRecord::Base
  belongs_to :meta_analysis
  belongs_to :treatment
end
