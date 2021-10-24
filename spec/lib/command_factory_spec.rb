require 'spec_helper'

describe CommandFactory do
  describe '#commmand' do
    let(:robot) { Robot.new }

    subject(:command) { CommandFactory.new(robot: robot, unparsed_command: unparsed_command).command }

    context 'a place command is passed' do
      let(:unparsed_command) { 'PLACE 0,0,EAST' }

      it { is_expected.to be_a(PlaceCommand) }
    end

    context 'a turn command is passed' do
      let(:unparsed_command) { 'LEFT' }

      it { is_expected.to be_a(TurnCommand) }
    end

    context 'a move command is passed' do
      let(:unparsed_command) { 'MOVE' }

      it { is_expected.to be_a(MoveCommand) }
    end

    context 'a report command is passed' do
      let(:unparsed_command) { 'REPORT' }

      it { is_expected.to be_a(ReportCommand) }
    end

    context 'an unknown command is passed' do
      let(:unparsed_command) { 'GIBBERISH' }

      it { is_expected.to be_a(UnknownCommand) }
    end
  end
end
