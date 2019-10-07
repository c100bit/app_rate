class History < ApplicationRecord
  belongs_to :rate

  validates :sum, presence: true,
    numericality: { greater_than: 0 }
  validates :force_date, presence: true
end
 