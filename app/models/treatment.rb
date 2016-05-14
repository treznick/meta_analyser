class Treatment < ActiveRecord::Base
  belongs_to :study
  validates :description, :effect_size, :standard_error, :study, presence: true
  validates :effect_size, numericality: true
  validates  :standard_error, numericality: { greater_than_or_equal_to: 0 }
end
