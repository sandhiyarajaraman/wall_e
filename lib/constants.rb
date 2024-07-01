# frozen_string_literal: true

module Constants
  NORTH = 'NORTH'
  SOUTH = 'SOUTH'
  EAST = 'EAST'
  WEST = 'WEST'
  #        N
  #        |
  #        |
  # W -----|----- E
  #        |
  #        |
  #        S
  VALID_DIRECTIONS = [NORTH, EAST, SOUTH, WEST].freeze
  ALLOWED_DIRECTIONS = VALID_DIRECTIONS.join('|')
  PLACE_COMMAND_REGEX = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(#{ALLOWED_DIRECTIONS})$/
  MOVE_COMMAND_REGEX = /^MOVE$/
  LEFT_COMMAND_REGEX = /^LEFT$/
  RIGHT_COMMAND_REGEX = /^RIGHT$/
  REPORT_COMMAND_REGEX = /^REPORT$/
end
