# frozen_string_literal: true

require 'interactor'

class RunCommand < Command
  include Interactor

  INVALID_COMMAND_ERROR = 'Invalid command.'

  def call
    validate_call

    result = parse_and_run(context.command)
    return if result.success?

    context.fail!(message: result.message)
  end

  def parse_and_run(command) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    case command
    when Constants::PLACE_COMMAND_REGEX
      invoke_place_command(command)
    when Constants::MOVE_COMMAND_REGEX
      Move.call(robot: context.robot, table: context.table)
    when Constants::LEFT_COMMAND_REGEX
      TurnLeft.call(robot: context.robot)
    when Constants::RIGHT_COMMAND_REGEX
      TurnRight.call(robot: context.robot)
    when Constants::REPORT_COMMAND_REGEX
      Report.call(robot: context.robot, table: context.table)
    else
      context.fail!(message: INVALID_COMMAND_ERROR)
    end
  end

  def invoke_place_command(command)
    _command, x, y, direction = command.gsub(',', ' ').split

    Place.call(
      robot: context.robot,
      table: context.table,
      x_coordinate: x.to_i,
      y_coordinate: y.to_i,
      direction:
    )
  end
end
