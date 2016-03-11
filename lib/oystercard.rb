
class Oystercard

  attr_reader :balance, :journeys

  MAX_AMOUNT = 90
  MIN_FARE = 1
  MAX_ERROR = "Cannot exceed max balance £#{MAX_AMOUNT}"
  MIN_ERROR = "You need to have at least £#{MIN_FARE}"

  def initialize
    @balance = 0
    @journeys = JourneyLog.new
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    raise MIN_ERROR unless balance > MIN_FARE
    @journeys.start(station)
  end

  def touch_out(station)
    @journeys.finish(station)
    deduct(journeys.journey.fare)
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def log_journey
    deduct(@journey.fare)
    @journeys << @journey
    @journey = nil
  end

end
