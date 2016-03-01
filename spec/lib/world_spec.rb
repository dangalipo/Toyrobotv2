require "spec_helper"

describe World do
  let(:world) { World.new }

  describe ".direction_names" do
    subject(:direction_names) { world.direction_names }

    specify { expect(direction_names.size).to eq(4) }
    specify { expect(direction_names.first).to eq("NORTH") }
    specify { expect(direction_names[1]).to eq("EAST") }
    specify { expect(direction_names[2]).to eq("SOUTH") }
    specify { expect(direction_names.last).to eq("WEST") }
  end

  describe ".x_move_for_direction" do
    subject { world.x_move_for_direction(0) }

    it { is_expected.to eq(0) }
  end

  describe ".y_move_for_direction" do
    subject { world.y_move_for_direction(0) }

    it { is_expected.to eq(1) }
  end

  describe ".on_x_plane?" do
    subject { world.on_x_plane?(position) }

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
    subject { world.on_y_plane?(position) }

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
    subject { world.direction_left_of_direction(0) }

    it { is_expected.to eq(3) }
  end

  describe ".direction_right_of_direction" do
    subject { world.direction_right_of_direction(3) }

    it { is_expected.to eq(0) }
  end
end
