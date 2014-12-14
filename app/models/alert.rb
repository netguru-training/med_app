class Alert < ActiveRecord::Base

belongs_to :user

validates :user_id, :doctor_id, :content, presence: true

end
