require 'journeylog'
describe JourneyLog do
  subject(:journeylog){described_class.new(journey_class)}
  let(:journey_class){double :journey_class, new: journey}
  let(:journey){double :journey}
  let(:station){double :station}

  describe "#start" do
    it "should create a new journey object" do
      expect(journey_class).to receive(:new)
      journeylog.start(station)
    end
  end

  describe "#finish" do
    it "should call complete on journey object" do
      expect(journey).to receive(:complete_journey).with(station)
      journeylog.start(station)
      journeylog.finish(station)
    end
  end

  describe "#current_journey" do
    it "should return an incomplete journey or create a new journey" do
      journeylog.start(station)
      expect(journeylog.current_journey).to eq journey
    end

    it "should return a new journey if no current journey" do
      expect(journeylog.current_journey).to eq journey
    end
  end


end
