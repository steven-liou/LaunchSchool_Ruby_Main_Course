class Clock
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = MINUTES_PER_HOUR * 24

  def self.at(hours, minutes=0)
    self.new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def to_s
    format("%02d:%02d", hours, minutes)
  end

  def +(add_minutes)
    new_minutes = (total_minutes + add_minutes) % MINUTES_PER_DAY
    self.hours, self.minutes = new_minutes.divmod(MINUTES_PER_HOUR)
    self
  end

  def -(sub_minutes)
    # new_minutes = (total_minutes - sub_minutes) % MINUTES_PER_DAY
    # self.hours, self.minutes = new_minutes.divmod(MINUTES_PER_HOUR)
    # self
    self + (-sub_minutes)
  end

  def ==(other_time)
    total_minutes == other_time.total_minutes
  end

  def total_minutes
    hours * MINUTES_PER_HOUR + minutes
  end

  private
  attr_accessor :minutes, :hours
end

clock = Clock.at(10) - 90

