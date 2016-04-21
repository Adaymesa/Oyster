require "journey"

describe Journey do
	subject(:journey) {described_class.new}
	let (:entry_station) {double :entry_station}
	let (:exit_station) {double :exit_station}
	let (:card) {double :card, touch_in: nil, touch_out: nil, top_up: nil, balance: 0, fare: 0}

	context "start a journey" do
		it "responds when you starts a journey" do
			expect(journey.start_journey(entry_station)).to eq entry_station
		end
	end
	context "end a journey" do
		it "responds when you end a journey" do
			expect(journey.end_journey(exit_station)).to eq exit_station
		end
	end
	context "track the journeys done" do
		it "tracks the travel that has been done" do
    	card.top_up(20)
     card.touch_in(entry_station)
     card.touch_out(exit_station)
     expect(journey.track_journey).to include { entrystation:entry_station, exitstation:exit_station }
		end
	end

	context "charge per travel & penalty" do
		# it "charge minimum fare per travel" do
		# 	card.top_up(20)
		# 	journey.start_journey(entry_station)
		# 	journey.end_journey(exit_station)
		# 	fair = journey.fare
		# 	# expect{journey.fare}.to change{card.balance}.by (Journey::MINIMUM_FARE)
		# 	expect{card.deduct(fare)}.to change{card.balance}.by (Journey::MINIMUM_FARE)
		# end
		# 	it "charge penalty" do
		# 	journey.end_journey(exit_station)
		# 	expect{journey.fare}.to change{card.balance}.by (Journey::PENALTY)
		# end
		it "returns a penalty fare if no exit station given" do
			journey.start_journey(entry_station)
      expect(subject.fare).to eq Journey::PENALTY
    end
	end
end

