require "spec_helper"

describe PlaceCommand do

  describe "#execute" do
    let(:robot) { Robot.new }
    let(:world) { World.new }
    subject(:place) { PlaceCommand.new(unparsed_command).execute(robot, world) }

    context "valid place command" do
      let(:unparsed_command) { "PLACE 0,0,WEST" }

      specify { expect{place}.to change(robot, :x_position).to(0) }
      specify { expect{place}.to change(robot, :y_position).to(0) }
      specify { expect{place}.to change(robot, :direction).to(3) }
    end

    context "invalid place command" do

      context "position outside of world" do
        let(:unparsed_command) { "PLACE 10,-10,WEST" }

        specify do
          expect{place}.to raise_error(PlaceCommand::InvalidPositionError,
            "Cannot place Robot at 10, -10 as it is not on the table."
          )
        end
      end

      context "direction not in world" do
        let(:unparsed_command) { "PLACE 0,0,NORTHWEST" }

        specify do
          expect{place}.to raise_error(PlaceCommand::InvalidDirectionError,
            "Cannot place Robot facing NORTHWEST as it is not a valid direction."
          )
        end
      end

    end

  end
end
