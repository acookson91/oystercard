require 'journey'

describe Journey do
  subject(:journey) { described_class.new euston }
  let(:euston) { double :station }

  it { is_expected.to respond_to(:entry_station) }

  it { is_expected.to respond_to(:exit_station) }

  describe "#initialize" do
    it "should initialize with an optional entry station argument" do
      expect(journey.entry_station).to eq euston
    end
  end

  describe "#complete_journey" do
    it 'should store exit_station' do
      journey.complete_journey(euston)
      expect(journey.exit_station).to eq euston
    end
  end

  describe "#complete?" do
    it "should return whether or not the journey is complete" do
      expect(journey).not_to be_complete
    end
  end

  describe "#fare" do
    it "should return 1 if the journey was complete" do
      journey.complete_journey euston
      expect(journey.fare).to eq 1
    end

    it "should return 6 if the journey was incomplete" do
      expect(journey.fare).to eq 6
    end
  end
end
