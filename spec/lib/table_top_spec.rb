require 'spec_helper'

describe TableTop do
  let(:table_top) { TableTop.new }

  describe '#valid_coordinates?' do
    let(:x_coordinate) { 1 }
    let(:y_coordinate) { 1 }
    let(:coordinates) do
      Coordinates.new(x_coordinate: x_coordinate, y_coordinate: y_coordinate)
    end

    subject { table_top.valid_coordinates?(coordinates) }

    context 'x_coordinate' do

      context 'is on x plane' do
        let(:x_coordinate) { 1 }

        it { is_expected.to be true }
      end

      context 'is not on x plane' do
        let(:x_coordinate) { -1 }

        it { is_expected.to be false }
      end
    end

    context 'y_coordinate' do

      context 'is on x plane' do
        let(:y_coordinate) { 1 }

        it { is_expected.to be true }
      end

      context 'is not on x plane' do
        let(:y_coordinate) { -1 }

        it { is_expected.to be false }
      end
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
