# frozen_string_literal: true

require 'interactor'

class Move < Command
  include Interactor

  MOVE_NOT_ALLOWED_ERROR = 'MOVE not allowed. Robot will fall off the table.'

  def validate_call
    super

    return unless context.robot.current_position.class != Position

    context.fail!(message: Robot::NOT_PLACED_ERROR)
  end

  def call
    validate_call

    potential_next_coordinates = context.robot.current_position.next_coordinates
    if context.table.place_valid?(potential_next_coordinates)
      context.robot.current_position.move_to_next_coordinates
    else
      context.fail!(message: MOVE_NOT_ALLOWED_ERROR)
    end
  end
end
