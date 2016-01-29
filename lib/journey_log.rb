require_relative 'journey'

class JourneyLog
  attr_reader 

  def initialize(journey_klass = Journey)
    @log = []
    @journey_klass = journey_klass
  end

  def history
     history = @log.dup
  end 

  def start_journey(station)
    @this_journey = @journey_klass.new
    @this_journey.starts(station)
    #p @this_journey
  end

  def end_journey(station)
    @this_journey.ends(station)
    @log << @this_journey
  end

end
