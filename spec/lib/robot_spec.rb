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

  describe '#place' do
    let(:robot) { Robot.new }
    let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
    let(:direction)   { 1 }

    subject(:place) { robot.place(coordinates, direction) }

    specify { expect{place}.to change(robot, :coordinates).to(coordinates) }
    specify { expect{place}.to change(robot, :direction).to(direction) }
  end

  describe '#move' do
    let(:new_coordinates) do
      Coordinates.new(x_coordinate: 2, y_coordinate: 2)
    end

    subject(:move) do
      robot.move(new_coordinates)
    end

    context 'robot is placed' do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, 1)
        end
      end

      specify do
        expect{move}.to change(robot, :coordinates).to(new_coordinates)
      end
    end

    context 'robot is not placed' do
      let(:robot) { Robot.new }
      specify { expect{move}.not_to change(robot, :coordinates) }
    end

  end

end
