class Rate < ApplicationRecord
  has_many :histories

  validates :sum, presence: true, 
    numericality: { greater_than: 0 }
  validates :title, presence: true
  validates :code, presence: true, length: { is: 3 },
    uniqueness: { case_sensitive: false }

  validates :force_date, presence: true, if: :force_sum?
  validates :force_sum, presence: true, 
    numericality: { greater_than: 0 }, if: :force_date? 

  #upcase code
  def code=(val)
    super(val.upcase) if val
  end
end
