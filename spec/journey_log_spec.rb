require 'journey_log'

describe JourneyLog do
subject(:journey_log){described_class.new(journey_klass)}

	let(:journey_klass){double(:journey_klass, new: this_journey)}
	let(:this_journey){double(:this_journey, :ends=>:entryexithash, :starts=>:entryhash)}
	let (:station){double :station}

	describe '#history' do
		context 'no journey started' do
			it "is empty when no journeys logged" do
				expect(journey_log.history).to be_empty
			end
		end
		context 'journey ended' do

			it "expect the history to include the entry exit hash" do
				
				journey_log.start_journey(:station)
				journey_log.end_journey(:station)
				expect(journey_log.history).to include(this_journey)
			end
		end
	end


	describe "#start_journey" do
		it  'instance of journey class, that has been initialized, receives starts method' do	
			expect(this_journey).to receive(:starts)
			journey_log.start_journey(:station)
		end
	end



	describe "#end_journey" do
		it 'instance of journey class receives ends method' do
			expect(this_journey).to receive(:ends)
			journey_log.start_journey(:station)
			journey_log.end_journey(:station)
		end
	end
end