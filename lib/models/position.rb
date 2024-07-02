# frozen_string_literal: true

class Position
  attr_accessor :coordinates, :direction

  Coordinates = Struct.new(:x_coordinate, :y_coordinate)

  def initialize(x_position, y_position, direction)
    @coordinates = Coordinates.new(x_position, y_position)
    @direction = direction
  end

  # Determine the next position's coordinates, if the robot moves in the direction it is facing
  def next_coordinates
    case @direction
    when Constants::NORTH
      Coordinates.new(@coordinates.x_coordinate, @coordinates.y_coordinate + 1)
    when Constants::EAST
      Coordinates.new(@coordinates.x_coordinate + 1, @coordinates.y_coordinate)
    when Constants::SOUTH
      Coordinates.new(@coordinates.x_coordinate, @coordinates.y_coordinate - 1)
    when Constants::WEST
      Coordinates.new(@coordinates.x_coordinate - 1, @coordinates.y_coordinate)
    end
  end

  def move_to_next_coordinates
    @coordinates = next_coordinates
  end

  #        N
  #        |
  #        |
  # W -----|----- E
  #        |
  #        |
  #        S
  def turn_right
    # [NORTH EAST SOUTH WEST]
    directions = Constants::VALID_DIRECTIONS
    current_direction_index = directions.index(@direction)
    @direction = if current_direction_index == (directions.length - 1)
                   directions[0]
                 else
                   directions[current_direction_index + 1]
                 end
  end

  def turn_left
    # [NORTH EAST SOUTH WEST]
    directions = Constants::VALID_DIRECTIONS
    current_direction_index = directions.index(@direction)
    @direction = if current_direction_index.zero?
                   directions[directions.length - 1]
                 else
                   directions[current_direction_index - 1]
                 end
  end

  # String representation of Position
  def to_s
    "Position => X: #{@coordinates.x_coordinate}, Y: #{@coordinates.y_coordinate}, Facing: #{@direction}"
  end
end
