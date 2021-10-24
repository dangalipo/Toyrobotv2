require 'spec_helper'

describe Robot do
  describe '#initialize' do
    subject(:robot) { Robot.new }

    specify { expect(robot.placed?).to be false }
  end

  describe '#placed?' do
    subject { robot.placed? }

    context 'robot is placed' do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
      let(:direction)   { Direction.new(name: 'EAST', move_x: -1, move_y: 0) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, direction)
        end
      end

      it { is_expected.to be true }
    end

    context 'robot is not placed' do
      let(:robot) { Robot.new }

      it { is_expected.to be false }
    end
  end

  describe '#place' do
    let(:robot) { Robot.new }
    let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
    let(:direction)   { Direction.new(name: 'EAST', move_x: -1, move_y: 0) }

    subject(:place) { robot.place(coordinates, direction) }

    specify { expect { place }.to change(robot, :coordinates).to(coordinates) }
    specify { expect { place }.to change(robot, :direction).to(direction) }
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
        expect { move }.to change(robot, :coordinates).to(new_coordinates)
      end
    end

    context 'robot is not placed' do
      let(:robot) { Robot.new }
      specify { expect { move }.not_to change(robot, :coordinates) }
    end
  end

  describe '#turn_to_face' do
    let(:direction)       { Direction.new(name: 'WEST', move_x: 1, move_y: 0) }
    let(:new_direction)   { Direction.new(name: 'EAST', move_x: -1, move_y: 0) }
    let(:coordinates)     { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
    let(:robot) do
      Robot.new.tap do |rob|
        rob.place(coordinates, direction)
      end
    end

    subject(:turn_to_face) { robot.turn_to_face(new_direction) }

    specify { expect { turn_to_face }.to change(robot, :direction).to(new_direction) }
  end

  describe '#x_position' do
    subject { robot.x_position }

    context "robot hasn't been placed" do
      let(:robot) { Robot.new }

      it { is_expected.to be_nil }
    end

    context 'robot has been placed' do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 2) }
      let(:direction)   { Direction.new(name: 'EAST', move_x: -1, move_y: 0) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, direction)
        end
      end

      it { is_expected.to eq(1) }
    end
  end

  describe '#y_position' do
    subject { robot.y_position }

    context "robot hasn't been placed" do
      let(:robot) { Robot.new }

      it { is_expected.to be_nil }
    end

    context 'robot has been placed' do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 2) }
      let(:direction)   { Direction.new(name: 'EAST', move_x: -1, move_y: 0) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, direction)
        end
      end

      it { is_expected.to eq(2) }
    end
  end

  describe '#to_s' do
    subject { robot.to_s }

    context "robot hasn't been placed" do
      let(:robot) { Robot.new }

      it { is_expected.to eq('') }
    end

    context 'robot has been placed' do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 2) }
      let(:direction)   { Direction.new(name: 'EAST', move_x: -1, move_y: 0) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, direction)
        end
      end

      it { is_expected.to eq('1,2,EAST') }
    end
  end

  describe '#direction_name' do
    subject { robot.direction_name }

    context "robot hasn't been placed" do
      let(:robot) { Robot.new }

      it { is_expected.to eq('') }
    end

    context 'robot has been placed' do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 2) }
      let(:direction)   { Direction.new(name: 'EAST', move_x: -1, move_y: 0) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, direction)
        end
      end

      it { is_expected.to eq('EAST') }
    end
  end
end
