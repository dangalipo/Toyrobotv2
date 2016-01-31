require "spec_helper"

describe World do

  describe ".instance" do
    subject(:instance) { World.instance }

    specify { expect(instance.x_plane).to eq((0..4)) }
    specify { expect(instance.y_plane).to eq((0..4)) }
    specify { expect(instance.directions.size).to eq(4) }
    specify do
      expect(instance.directions.first)
        .to eq({name: "NORTH", move_x: 0, move_y: 1})
    end
    specify do
      expect(instance.directions[1])
        .to eq({name: "EAST", move_x: -1, move_y: 0})
    end
    specify do
      expect(instance.directions[2])
        .to eq({name: "SOUTH", move_x: 0, move_y: -1})
    end
    specify do
      expect(instance.directions.last)
        .to eq({name: "WEST", move_x: 1, move_y: 0})
    end

  end

  describe ".direction_names" do
    subject(:direction_names) { World.direction_names }

    specify { expect(direction_names.size).to eq(4) }
    specify { expect(direction_names.first).to eq("NORTH") }
    specify { expect(direction_names[1]).to eq("EAST") }
    specify { expect(direction_names[2]).to eq("SOUTH") }
    specify { expect(direction_names.last).to eq("WEST") }
  end

  describe ".x_move_for_direction" do
    subject { World.x_move_for_direction(0) }

    it { is_expected.to eq(0) }
  end

  describe ".y_move_for_direction" do
    subject { World.y_move_for_direction(0) }

    it { is_expected.to eq(1) }
  end

  describe ".on_x_plane?" do
    subject { World.on_x_plane?(position) }

    context "position is on x plane" do
      let(:position) { 1 }

      it { is_expected.to be true }
    end

    context "position is not on x plane" do
      let(:position) { -1 }

      it { is_expected.to be false }
    end
  end

  describe ".on_y_plane?" do
    subject { World.on_y_plane?(position) }

    context "position is on y plane" do
      let(:position) { 1 }

      it { is_expected.to be true }
    end

    context "position is not on y plane" do
      let(:position) { -1 }

      it { is_expected.to be false }
    end
  end

  describe ".direction_left_of_direction" do
    subject { World.direction_left_of_direction(0) }

    it { is_expected.to eq(3) }
  end

  describe ".direction_right_of_direction" do
    subject { World.direction_right_of_direction(3) }

    it { is_expected.to eq(0) }
  end
end
