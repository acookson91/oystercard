require_relative 'Oystercard'

class Journey
  attr_reader :entry_station, :exit_station
  PENALTY_FARE = 6
  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete_journey(station)
    @exit_station = station
  end

  def complete?
    entry_station != nil && exit_station != nil
  end

  def fare
    complete? ? Oystercard::MIN_FARE : PENALTY_FARE
  end
end
