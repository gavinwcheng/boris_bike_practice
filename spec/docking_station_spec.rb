require "docking_station"
require "bike"

describe DockingStation do
  it "respond to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it "releases working bike" do
    #expect(subject.release_bike).to be_an_instance_of(Bike)
    subject.dock Bike.new
    expect(subject.release_bike).to be_working
  end

  it "respond to dock" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  describe "#release_bike" do
    it "raises an error when there is no bikes available" do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end

  describe "#dock" do
    it "raises an error when docking station is full" do
      subject.dock Bike.new
      expect { subject.dock Bike.new }.to raise_error "Docking station full"
    end
  end
end
