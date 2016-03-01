require "spec_helper"

describe World do
  let(:world) { World.new }

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
    let(:direction) { world.find_direction_by_name("NORTH") }
    let(:expected_direction) { world.find_direction_by_name("WEST") }
    subject { world.direction_left_of_direction(direction) }

    it { is_expected.to eq(expected_direction) }
  end

  describe ".direction_right_of_direction" do
    let(:direction) { world.find_direction_by_name("WEST") }
    let(:expected_direction) { world.find_direction_by_name("NORTH") }
    subject { world.direction_right_of_direction(direction) }

    it { is_expected.to eq(expected_direction) }
  end

  describe '#find_direction_by_name' do
    let(:world) { World.new }

    subject(:direction) { world.find_direction_by_name(name) }
    context 'direction exists' do
      let(:name) { "WEST" }

      specify { expect(direction.name).to eq(name) }
    end

    context "direction doesn't exist" do
      let(:name) { "NORTHWEST" }

      specify { expect(direction).to be_nil }
    end

  end
end
