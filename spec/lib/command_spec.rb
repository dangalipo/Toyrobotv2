require "spec_helper"

describe Command do

  describe "#execute" do

    subject(:execute) { Command.new.execute(Robot.new) }

    specify do
      expect{execute}.to raise_error(NotImplementedError,
        "Subclasses of Command are exepected to implement #execute(robot)"
      )
    end

  end

end
