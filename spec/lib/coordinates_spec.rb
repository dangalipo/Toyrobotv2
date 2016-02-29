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

  describe '#set_coordinates' do
    let(:x_coordinate) { 1 }
    let(:y_coordinate) { 1 }
    let(:new_x_coordinate) { 2 }
    let(:new_y_coordinate) { 2 }

    subject(:set_coordinates) do
      coordinates.set_coordinates(x_coordinate: new_x_coordinate,
                                  y_coordinate: new_y_coordinate)
    end

    specify do
      expect{set_coordinates}
        .to change(coordinates, :x_coordinate)
        .to(new_x_coordinate)
    end
    specify do
      expect{set_coordinates}
        .to change(coordinates, :y_coordinate)
        .to(new_y_coordinate)
    end
  end

  describe '#to_s' do
    subject { coordinates.to_s }

    it { is_expected.to eq("#{x_coordinate},#{y_coordinate}") }
  end

end
