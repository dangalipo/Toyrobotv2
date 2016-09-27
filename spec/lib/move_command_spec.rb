require 'spec_helper'

describe MoveCommand do

  describe '#execute' do
    let(:world)  { World.new }
    subject(:move) { MoveCommand.new(robot, 'MOVE').execute(world)}

    context 'robot is placed' do
      let(:coordinates) do
        Coordinates.new(x_coordinate: 0,
                        y_coordinate: 0)
      end
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, direction)
        end
      end

      context 'move would be destructive' do
        context 'move on the x axis would be destructive' do
          let(:direction) { world.find_direction_by_name('EAST') }

          specify { expect{move}.not_to change(robot, :x_position) }
        end

        context 'move on the y axis would be destructive' do
          let(:direction) { world.find_direction_by_name('SOUTH') }

          specify { expect{move}.not_to change(robot, :y_position) }
        end
      end

      context 'move is not desctructive' do
        context 'move on the x axis' do
          let(:direction) { world.find_direction_by_name('WEST') }

          specify { expect{move}.to change(robot, :x_position).to(1) }
        end

        context 'move on the y axis' do
          let(:direction) { world.find_direction_by_name('NORTH') }

          specify { expect{move}.to change(robot, :y_position).to(1) }
        end

      end
    end

    context 'robot is not placed' do
      let(:robot) { Robot.new }

      specify { expect{move}.not_to change(robot, :x_position) }
      specify { expect{move}.not_to change(robot, :y_position) }
    end

  end

end
