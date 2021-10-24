require 'spec_helper'

describe Command do
  describe '#execute' do
    subject(:execute) { Command.new(Robot.new(table_top: TableTop.new), '').execute }

    specify do
      expect { execute }.to raise_error(NoMethodError,
                                        'Subclasses of Command are exepected to implement #execute')
    end
  end
end
