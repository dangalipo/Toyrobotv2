require 'spec_helper'

describe TableTop do
  let(:table_top) { TableTop.new }

  describe '.on_x_plane?' do
    subject { table_top.on_x_plane?(position) }

    context 'position is on x plane' do
      let(:position) { 1 }

      it { is_expected.to be true }
    end

    context 'position is not on x plane' do
      let(:position) { -1 }

      it { is_expected.to be false }
    end
  end

  describe '.on_y_plane?' do
    subject { table_top.on_y_plane?(position) }

    context 'position is on y plane' do
      let(:position) { 1 }

      it { is_expected.to be true }
    end

    context 'position is not on y plane' do
      let(:position) { -1 }

      it { is_expected.to be false }
    end
  end

  describe '.direction_left_of_direction' do
    let(:direction) { table_top.find_direction_by_name('NORTH') }
    let(:expected_direction) { table_top.find_direction_by_name('WEST') }
    subject { table_top.direction_left_of_direction(direction) }

    it { is_expected.to eq(expected_direction) }
  end

  describe '.direction_right_of_direction' do
    let(:direction) { table_top.find_direction_by_name('WEST') }
    let(:expected_direction) { table_top.find_direction_by_name('NORTH') }
    subject { table_top.direction_right_of_direction(direction) }

    it { is_expected.to eq(expected_direction) }
  end

  describe '#find_direction_by_name' do
    let(:table_top) { TableTop.new }

    subject(:direction) { table_top.find_direction_by_name(name) }
    context 'direction exists' do
      let(:name) { 'WEST' }

      specify { expect(direction.name).to eq(name) }
    end

    context "direction doesn't exist" do
      let(:name) { 'NORTHWEST' }

      specify { expect(direction).to be_nil }
    end

  end
end
