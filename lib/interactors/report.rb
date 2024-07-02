# frozen_string_literal: true

require 'interactor'

class Report < Command
  include Interactor

  def validate_call
    super

    return unless context.robot.current_position.class != Position

    context.fail!(message: Robot::NOT_PLACED_ERROR)
  end

  def call
    validate_call

    context.robot.print_position
    print_table_layout
  end

  def print_table_layout # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    robot_coordinates = context.robot.current_position.coordinates
    robot_direction = context.robot.current_position.direction
    max_y_unit = context.table.max_y_unit
    max_x_unit = context.table.max_x_unit
    (0..max_y_unit).each do |y|
      # Enter Y-coordinate mappers
      row = ["{{magenta:#{max_y_unit - y}|}}"]
      (0..max_x_unit).each do |x|
        row << if [robot_coordinates.x_coordinate,
                   robot_coordinates.y_coordinate] == [x, max_y_unit - y]
                 # Show robot on the table with facing direction's first char
                 "{{yellow:#{robot_direction.slice(0)}}}"
               else
                 # Show empty position where robot is not present
                 '{{yellow:*}}'
               end
      end
      puts CLI::UI.fmt row.join('  ')
    end

    # buffer padding for Y-coordinate mappers
    x_row = ['  ']
    # Print X-coordinate mappers
    (0..max_x_unit).each do |x|
      x_row << "{{magenta:#{x}}}"
    end
    puts CLI::UI.fmt x_row.join('  ')
  end
end
