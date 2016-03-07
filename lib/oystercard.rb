class Oystercard

  attr_reader :balance

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Exceeds £#{Oystercard::MAX_AMOUNT} top up limit" if max_exceeded?(amount)
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "You must have at least £1 to touch in" if below_min?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

    def max_exceeded?(amount)
      @balance + amount > MAX_AMOUNT
    end

    def below_min?
      @balance < MIN_AMOUNT
    end

end
