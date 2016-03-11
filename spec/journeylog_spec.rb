require 'journeylog'
describe JourneyLog do
  subject(:journeylog){described_class.new(journey_class)}
  let(:journey_class){double :journey_class, new: journey}
  let(:journey){double :journey, complete_journey: nil}
  let(:station){double :station}

  describe "#start" do
    it "should create a new journey object" do
      expect(journey_class).to receive(:new)
      journeylog.start(station)
    end
  end

  describe "#finish" do

    before do
      journeylog.start(station)
    end

    it "should call complete on journey object" do
      expect(journey).to receive(:complete_journey).with(station)
      journeylog.finish(station)
    end

    it "should sort journey into history" do
      journeylog.finish(station)
      expect(journeylog.journeys).to eq [journey]
    end
  end


end
