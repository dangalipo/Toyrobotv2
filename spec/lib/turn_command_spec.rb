require 'spec_helper'

describe TurnCommand do
  describe '#execute' do
    let(:table_top) { TableTop.new }
    let(:robot) { Robot.new(table_top: table_top) }
    subject(:turn) { TurnCommand.new(robot, unparsed_command).execute(table_top) }

    context 'robot has been placed' do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
      before do
        robot.place(coordinates, direction)
      end

      context 'turning left' do
        let(:unparsed_command) { 'LEFT' }
        let(:direction) { table_top.find_direction_by_name('NORTH') }

        specify { expect { turn }.to change(robot, :direction_name).to('WEST') }
      end
      context 'turning right' do
        let(:unparsed_command) { 'RIGHT' }
        let(:direction) { table_top.find_direction_by_name('WEST') }

        specify { expect { turn }.to change(robot, :direction_name).to 'NORTH' }
      end
    end

    context 'robot has not been placed' do
      let(:unparsed_command) { 'RIGHT' }

      specify { expect { turn }.not_to change(robot, :direction) }
    end
  end
end
