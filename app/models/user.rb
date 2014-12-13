class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entries
  has_many :patients, class_name: 'User', foreign_key: :doctor_id

  validates :firstname, :lastname, presence: true
  paginates_per 15
end
