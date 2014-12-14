class HealthWarning
  attr_accessor :user, :warnings

  def initialize(user)
    self.user = user
    self.warnings = ""
  end

  def check_sugar
    arr = user.entries.for_examination("sugar_level").last(3).map(&:value)
    avg = arr.inject(:+).to_i / 3.0
    if avg > 0
      warnings << 'Your sugar level is too high, you will die soon. kkthxbye :('
    end
    self
  end


end
