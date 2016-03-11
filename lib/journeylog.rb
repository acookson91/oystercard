class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
  end

  def start(station)
    @journey = @journey_class.new(station)
  end

  def finish(station)
    @journey.complete_journey(station)
  end

  def current_journey
    @journey ||= @journey_class.new
  end
end
