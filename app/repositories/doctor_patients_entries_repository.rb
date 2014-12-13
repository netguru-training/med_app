class DoctorPatientsEntriesRepository
  attr_accessor :user

  def initialize(user)
    self.user = user
  end

  def all
    Entry.joins(:user).where(users: {doctor_id: user.id} ).order('created_at DESC')
  end
end