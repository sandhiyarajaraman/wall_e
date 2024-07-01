# frozen_string_literal: true

# Add lib directory to $LOAD_PATH
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'cli/ui'
require 'models/table'
require 'models/position'
require 'models/robot'
require 'interactors/command'
require 'interactors/run_command'
require 'interactors/move'
require 'interactors/place'
require 'interactors/report'
require 'interactors/turn_left'
require 'interactors/turn_right'
require 'constants'

# create a new table and robot
table = Table.new(5, 5)
robot = Robot.new

loop do
  puts CLI::UI.fmt "{{blue:#{Constants::ENTER_COMMAND_TEXT}}}"

  input = gets

  break if input =~ /exit/i

  result = RunCommand.call(command: input, table:, robot:)

  # log the error message
  puts CLI::UI.fmt "{{red:#{result.message}}}" unless result.success?
end
