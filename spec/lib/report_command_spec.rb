require "spec_helper"

describe ReportCommand do

  describe '#execute' do
    let(:unparsed_command) { 'REPORT' }
    let(:world) { World.new }
    subject(:report) { ReportCommand.new(robot, unparsed_command).execute(world) }

    context 'robot has been placed' do
      let(:direction) { world.find_direction_by_name('EAST') }
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, direction)
        end
      end

      specify { expect{report}.to output("1,1,EAST\n").to_stdout }
    end

    context 'robot has not been placed' do
      let(:robot) { Robot.new }

      specify { expect{report}.not_to output("1,1,EAST\n").to_stdout }
    end
  end
end
