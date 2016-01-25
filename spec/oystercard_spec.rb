require 'oystercard'

describe Oystercard do
  subject(:card){described_class.new}
	it "new card balance == 0" do
		expect(card.balance).to eq 0
	end
  context "changing balance" do
    it "topping up balance" do
      expect{card.top_up(10)}.to change{ card.balance}.by 10
    end
    it "raises error if over limit" do
    	expect{card.top_up(Oystercard::TOP_UP_LIMIT + 1)}.to raise_error
    	"Exceeds £#{Oystercard::TOP_UP_LIMIT} top up limit."
    end

  end
end