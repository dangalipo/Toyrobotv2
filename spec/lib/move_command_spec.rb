require "spec_helper"

describe MoveCommand do

  describe "#execute" do
    let(:robot) do
      Robot.new.tap do |rob|
        rob.x_position = x_position
        rob.y_position = y_position
        rob.direction = direction
        rob.placed = placed
      end
    end

    subject(:move) { MoveCommand.new("MOVE").execute(robot)}

    context "robot is placed" do
      let(:placed) { true }
      let(:x_position) { 0 }
      let(:y_position) { 0 }

      context "move would be destructive" do
        context "move on the x axis would be destructive" do
          let(:direction) { 1 }

          specify { expect{move}.not_to change(robot, :x_position) }
        end

        context "move on the y axis would be destructive" do
          let(:direction) { 2 }

          specify { expect{move}.not_to change(robot, :y_position) }
        end
      end

      context "move is not desctructive" do
        context "move on the x axis" do
          let(:direction) { 3 }

          specify { expect{move}.to change(robot, :x_position).to(1) }
        end

        context "move on the y axis" do
          let(:direction) { 0 }

          specify { expect{move}.to change(robot, :y_position).to(1) }
        end

      end
    end

    context "robot is not placed" do
      let(:placed) { false }
      let(:x_position) { nil }
      let(:y_position) { nil }
      let(:direction) { nil }

      specify { expect{move}.not_to change(robot, :x_position) }
      specify { expect{move}.not_to change(robot, :y_position) }
    end

  end

end
