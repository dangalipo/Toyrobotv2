require "spec_helper"

describe ReportCommand do

  describe "#execute" do
    let(:unparsed_command) { "REPORT" }
    let(:world) { World.new }
    subject(:report) { ReportCommand.new(unparsed_command).execute(robot, world) }

    context "robot has been placed" do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
      let(:robot) do
        Robot.new.tap do |rob|
          rob.place(coordinates, 1)
        end
      end

      specify { expect{report}.to output("1,1,EAST\n").to_stdout }
    end

    context "robot has not been placed" do
      let(:robot) { Robot.new }

      specify { expect{report}.not_to output("1,1,EAST\n").to_stdout }
    end
  end
end
