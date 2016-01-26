class Oystercard

  attr_reader :balance

  MAX_BALANCE=90
  MIN_TRAVEL_BALANCE=1
  MIN_FARE=1.50

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up (value)
    raise "Balance cannot exceed £#{MAX_BALANCE}" if (@balance + value) > MAX_BALANCE
    @balance += value
  end

  def entry_station (station)
  	station
  end

  def in_journey?
    @in_journey
  end

  def touch_in (station)
  	raise 'Insufficient funds to travel' if @balance < MIN_TRAVEL_BALANCE
    @in_journey = true
    entry_station(station)
  end

 
  def touch_out
  	@in_journey = false
  	deduct(MIN_FARE)

  end

  private
  def deduct(value)
  	@balance -= value
  end

end
