class JourneyLog

  attr_reader :journey

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journey_history = []
  end

  def start(station)
    @journey = @journey_class.new(station)
  end

  def journeys
    @journey_history.dup
  end

  def finish(station)
    current_journey.complete_journey(station)
    @journey_history << @journey
  end

  def get_fare
    @journey.fare
  end

private

 attr_reader :journey_history

  def current_journey
    @journey ||= @journey_class.new
  end
end
