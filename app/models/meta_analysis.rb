class MetaAnalysis < ActiveRecord::Base
  validates :description, presence: true, uniqueness: true
end
