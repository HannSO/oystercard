require 'oystercard.rb'

describe Oystercard do
  subject(:oyster) { described_class.new }

  it 'has a default balance of 0' do
    expect(oyster.balance).to eq 0
  end

   describe '#top-up' do
   		it 'can top up by amount passed in' do
   			expect{ oyster.top_up(1)}.to change{ oyster.balance}.by 1
   		end

      it 'raises an error if user tries to top-up balance over 90' do
        oyster.top_up(Oystercard::MAX_BALANCE)
        expect{oyster.top_up(1)}.to raise_error "Balance cannot exceed £#{Oystercard::MAX_BALANCE}"
      end
   	end


  #describe '#deduct' do

  		#it 'should deduct amount off balance passed through method' do
  			#expect{oyster.deduct(1)}.to change{oyster.balance}.by -1
  		#end
  	#end

  describe '#in_journey?' do

    it 'expect oyster card not to initially be in journey' do
      expect(subject).not_to be_in_journey
     end
  end



  describe '#touch_in' do

    it 'changes in_journey? to true' do
    	oyster.top_up(2)
    	oyster.touch_in
      expect(subject).to be_in_journey
    end

    it 'should raise an error if you try and travel with less than £1' do
    	expect{oyster.touch_in}.to raise_error 'Insufficient funds to travel'
    end

  end

  describe '#touch_out' do

  	it 'changes in_journey? to false' do
  		oyster.top_up(10)
  		oyster.touch_in
  		oyster.touch_out
  		expect(subject).not_to be_in_journey
 
  	end

  	it 'deducts a fare from the oystercard' do
  		oyster.top_up(10)
  		oyster.touch_in
  		expect{oyster.touch_out}.to change{oyster.balance}.by(-Oystercard::MIN_FARE)
  	end

  	

  end




end
