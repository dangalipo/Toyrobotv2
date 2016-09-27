require "spec_helper"

describe RobotSimulator do
  let(:file_path) do
    File.expand_path("../../fixtures/#{file_name}", __FILE__)
  end
  subject(:execute) do
    RobotSimulator.new(commands_path: file_path).execute
  end

  describe "commands file not found" do
    let(:file_name) { "not_a_file.txt" }
    specify do
      expect{execute}
        .to output("File not found #{file_path}\n").to_stdout
    end
  end

  describe "valid commands set" do
    context "excludes ignorable commands" do
      let(:expected_position) { "2,1,WEST\n" }
      let(:file_name) { "valid_commands.txt" }

      specify { expect{execute}.to output(expected_position).to_stdout }
    end

    context "includes include commands" do
      let(:expected_position) { "0,2,NORTH\n" }
      let(:file_name) { "valid_ignorable_commands.txt" }

      specify { expect{execute}.to output(expected_position).to_stdout }
    end

    context "multiple place commands" do
      let(:expected_position) { "3,3,SOUTH\n" }
      let(:file_name) { "valid_multiple_place_commands.txt" }

      specify { expect{execute}.to output(expected_position).to_stdout }
    end
  end

  describe "invalid commands" do
    context "partially matching command" do
      let(:file_name) { "invalid_partially_matching_command.txt" }

      specify do
        expect{execute}
          .to output("Don't know how to process MOVE WEST\n").to_stdout
      end
    end

    context "unknown command" do
      let(:file_name) { "invalid_unknown_command.txt" }

      specify do
        expect{execute}
          .to output("Don't know how to process KILL ALL HUMANS\n").to_stdout
      end
    end

    context "place command without correct arguments" do

      context "too many arguments" do
        let(:file_name) { "invalid_place_command_too_many_args.txt" }

        specify do
          expect{execute}
            .to output("Don't know how to process PLACE 0,0,EAST,20\n").to_stdout
        end
      end

      context "not enough arguments" do
        let(:file_name) { "invalid_place_command_too_few_args.txt" }

        specify do
          expect{execute}
            .to output("Don't know how to process PLACE 0,0\n").to_stdout
        end
      end

      context "invalid direction" do
        let(:file_name) { "invalid_place_command_direction.txt" }

        specify do
          expect{execute}
            .to output("Cannot place Robot facing NORTHWEST as it is not a valid direction.\n").to_stdout
        end
      end

      context "position off the table" do
        let(:file_name) { "invalid_place_command_position.txt" }

        specify do
          expect{execute}
            .to output("Cannot place Robot at 10,-10 as it is not on the table.\n").to_stdout
        end
      end
    end
  end
end
