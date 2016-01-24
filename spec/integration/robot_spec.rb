require "spec_helper"

describe RobotSimulator do
  let(:file_path) do
    File.expand_path("../../fixtures/#{file_name}", __FILE__)
  end
  subject(:execute) do
    RobotSimulator.new(interactive: false,
                       instruction_set_file: file_path
    ).execute
  end

  describe "valid commands set" do
    context "excludes ignorable commands" do
      let(:expected_position) { "2,1,WEST\n" }
      let(:file_name) { "valid_commands.txt" }

      specify { execute }
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

      specify { expect{execute}.to raise_error }
    end

    context "unknown command" do
      let(:file_name) { "invalid_unknown_command.txt" }

      specify { expect{execute}.to raise_error }
    end

    context "place command without correct arguments" do

      context "too many arguments" do
        let(:file_name) { "invalid_place_command_too_many_args.txt" }

        specify { expect{execute}.to raise_error }
      end

      context "not enough arguments" do
        let(:file_name) { "invalid_place_command_too_few_args.txt" }

        specify { expect{execute}.to raise_error }
      end

      context "invalid direction" do
        let(:file_name) { "invalid_place_command_direction.txt" }

        specify { expect{execute}.to raise_error }
      end

      context "position off the table" do
        let(:file_name) { "invalid_place_command_position.txt" }

        specify { expect{execute}.to raise_error }
      end
    end
  end
end
