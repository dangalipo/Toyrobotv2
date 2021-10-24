# frozen_string_literal: true

class UnknownCommand < Command
  class UnknownCommandError < ArgumentError; end

  def execute
    raise UnknownCommandError,
          "Don't know how to process #{unparsed_command}"
  end

end
