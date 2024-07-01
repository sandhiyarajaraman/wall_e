# frozen_string_literal: true

class Place < Command
  include Interactor

  INVALID_PLACE_ERROR = 'PLACE command is given invalid coordinates.'
  INVALID_PLACE_COMMAND_ERROR = 'PLACE command is invalid'

  def validate_call
    super

    return unless context.x_coordinate.nil? || context.y_coordinate.nil? || context.direction.nil?

    context.fail!(message: INVALID_PLACE_COMMAND_ERROR)
  end

  def call # rubocop:disable Metrics/AbcSize
    validate_call

    new_position = Position.new(context.x_coordinate, context.y_coordinate, context.direction)
    if context.table.place_valid?(new_position.coordinates)
      context.robot.current_position = new_position
    else
      context.fail!(message: INVALID_PLACE_ERROR)
    end
  end
end
