require "spec_helper"

describe TurnCommand do

  describe "#execute" do
    subject(:turn) { TurnCommand.new(unparsed_command).execute(robot) }

    context "robot has been placed" do

      context "turning left" do
        let(:unparsed_command) { "LEFT" }
        let(:robot) do
          Robot.new.tap do |rob|
            rob.x_position = 1
            rob.y_position = 1
            rob.direction = 0
            rob.placed = true
          end
        end

        specify { expect{turn}.to change(robot, :direction).to(3) }
      end
      context "turning right" do
        let(:unparsed_command) { "RIGHT" }
        let(:robot) do
          Robot.new.tap do |rob|
            rob.x_position = 1
            rob.y_position = 1
            rob.direction = 3
            rob.placed = true
          end
        end

        specify { expect{turn}.to change(robot, :direction).to 0 }
      end
    end

    context "robot has not been placed" do
      let(:unparsed_command) { "RIGHT" }
      let(:robot) { Robot.new }

      specify { expect{turn}.not_to change(robot, :direction) }
    end
  end

end
