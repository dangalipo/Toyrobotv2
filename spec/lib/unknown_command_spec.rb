require 'spec_helper'

RSpec.describe UnknownCommand do
  let(:unparsed_command) { 'GIBBERISH' }
  let(:table_top) { TableTop.new }
  let(:robot) { Robot.new(table_top: table_top) }
  subject(:unknown_command) { UnknownCommand.new(robot, unparsed_command).execute }

  specify do
    expect { subject }.to raise_error(UnknownCommand::UnknownCommandError,
                                      "Don't know how to process #{unparsed_command}")
  end
end
