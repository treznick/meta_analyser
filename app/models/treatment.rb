class Treatment < ActiveRecord::Base
  belongs_to :study
  has_many :meta_analysis_treatments
  has_many :meta_analyses, through: :meta_analysis_treatments

  validates :description, :effect_size, :standard_error, presence: true
  validates :effect_size, numericality: true
  validates  :standard_error, numericality: { greater_than_or_equal_to: 0 }
end
