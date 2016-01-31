require "spec_helper"

describe ReportCommand do

  describe "#execute" do
    let(:unparsed_command) { "REPORT" }
    subject(:report) { ReportCommand.new(unparsed_command).execute(robot) }

    context "robot has been placed" do
      let(:robot) do
        Robot.new.tap do |rob|
          rob.x_position = 1
          rob.y_position = 1
          rob.direction = 1
          rob.placed = true
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
