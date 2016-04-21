class Journey
	
	attr_reader :entry_station, :exit_station
	attr_accessor :card, :fare

	MINIMUM_FARE = 1
	PENALTY = 6

	def initialize(card = Oystercard.new, *entry_station)
		@track_journey = []
		@card = card
		@balance = 0
		@fare = 0
		@in_use = nil
	end

	def start_journey(entry_station)
		@in_use = false
		@entry_station = entry_station
	end
	def end_journey(exit_station)
		@in_use = true
		@exit_station = exit_station
	end
	def track_journey
		current_journey = { entrystation: @entry_station, exitstation: @exit_station }
		@track_journey.push(current_journey)
	end
	def fare
		@fare += MINIMUM_FARE if complete? 
		@fare += PENALTY if !complete?
		@fare
	end

private	
	
	def complete?
		@in_use
	end

end