class Entry < ActiveRecord::Base
  belongs_to :user

  enum examination_type: [:blood_pressure_in, :blood_pressure_out, :weight, :sugar_level, :heart_rate]

  validates :value, :examination_type, presence: true


  scope :blood_pressure_in, -> { where(examination_type: 0) }
  scope :blood_pressure_out, -> { where(examination_type: 1) }
  scope :weight, -> { where(examination_type: 2) }
  scope :sugar_level, -> { where(examination_type: 3) }
  scope :heart_rate, -> { where(examination_type: 4) }


end
