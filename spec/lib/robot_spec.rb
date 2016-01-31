require "spec_helper"

describe Robot do

  describe "#initialize" do
    subject(:robot) { Robot.new }

    specify { expect(robot.placed).to be false }
  end

  describe "#placed?" do
    let(:robot) do
      Robot.new.tap do |rob|
        rob.placed = placed
      end
    end

    subject { robot.placed? }

    context "robot is placed" do
      let(:placed) { true }

      it { is_expected.to be true }
    end

    context "robot is not placed" do
      let(:placed) { false }

      it { is_expected.to be false }
    end

  end

end
