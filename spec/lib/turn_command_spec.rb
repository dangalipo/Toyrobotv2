require "spec_helper"

describe TurnCommand do

  describe "#execute" do
    let(:world) { World.new }
    subject(:turn) { TurnCommand.new(unparsed_command).execute(robot, world) }

    context "robot has been placed" do
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }

      context "turning left" do
        let(:unparsed_command) { "LEFT" }
        let(:robot) do
          Robot.new.tap do |rob|
            rob.place(coordinates, 0)
          end
        end

        specify { expect{turn}.to change(robot, :direction).to(3) }
      end
      context "turning right" do
        let(:unparsed_command) { "RIGHT" }
        let(:robot) do
          Robot.new.tap do |rob|
            rob.place(coordinates, 3)
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
