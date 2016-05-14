class Study < ActiveRecord::Base
  validates :name, :authors, :year, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 0 }
end
