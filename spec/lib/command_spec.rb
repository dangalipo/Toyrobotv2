require 'spec_helper'

describe Command do
  describe '#execute' do
    subject(:execute) { Command.new(Robot.new, '').execute(TableTop.new) }

    specify do
      expect { execute }.to raise_error(NotImplementedError,
                                        'Subclasses of Command are exepected to implement #execute(table_top)')
    end
  end
end
