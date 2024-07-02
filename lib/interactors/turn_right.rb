# frozen_string_literal: true

class TurnRight < Command
  include Interactor

  BAD_RIGHT_COMMAND_CALL_ERROR = 'RIGHT command is called without the robot object'

  def validate_call
    context.fail!(message: BAD_RIGHT_COMMAND_CALL_ERROR) if context.robot.class != Robot

    return unless context.robot.current_position.class != Position

    context.fail!(message: Robot::NOT_PLACED_ERROR)
  end

  def call
    validate_call

    context.robot.current_position.turn_right
  end
end
