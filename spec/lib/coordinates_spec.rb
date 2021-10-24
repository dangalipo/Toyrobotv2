require 'spec_helper'

describe Coordinates do
  let(:x_coordinate) { rand(0..4) }
  let(:y_coordinate) { rand(0..4) }
  let(:coordinates) do
    Coordinates.new(x_coordinate: x_coordinate,
                    y_coordinate: y_coordinate)
  end

  describe '#x_coordinate' do
    subject { coordinates.x_coordinate }

    it { is_expected.to eq(x_coordinate) }
  end

  describe '#y_coordinate' do
    subject { coordinates.y_coordinate }

    it { is_expected.to eq(y_coordinate) }
  end

  describe '#to_s' do
    subject { coordinates.to_s }

    it { is_expected.to eq("#{x_coordinate},#{y_coordinate}") }
  end
end
