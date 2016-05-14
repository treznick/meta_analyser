class Study < ActiveRecord::Base
  has_many :treatments
  validates :name, :authors, :year, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 0 }
end
