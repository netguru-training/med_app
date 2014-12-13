class Entry < ActiveRecord::Base
  belongs_to :user

  enum examination_type: [:blood_pressure_in, :blood_pressure_out, :weight, :sugar_level, :heart_rate]
end
