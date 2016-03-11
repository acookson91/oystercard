require 'oystercard'

describe Oystercard do
  subject(:oystercard){described_class.new}
  let(:journey_class){double :journey_class, new: journey}
  let(:journey){double :journey}

  let(:journeylog){double :journeylog}
  let(:station){double :station}

  describe "#touch_in" do
    it "should call start on journeylog" do
      oystercard.top_up(2)
      expect(oystercard.journeys).to receive(:start).with(station)
      oystercard.touch_in(station)
    end
  end

  describe '#touch_out' do
    it 'should call finish on journeylog' do
      expect(oystercard.journeys).to receive(:finish).with(station)
      oystercard.touch_out(station)
    end
  end



end
