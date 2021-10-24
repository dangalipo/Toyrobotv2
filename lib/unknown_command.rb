class UnknownCommand < Command
  class UnknownCommandError < ArgumentError; end

  def initialize(robot, unparsed_command)
    super
    self.unparsed_command = unparsed_command
  end

  def execute(_table_top)
    raise UnknownCommandError,
          "Don't know how to process #{unparsed_command}"
  end

  private

  attr_accessor :unparsed_command
end
