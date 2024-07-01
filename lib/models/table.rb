# frozen_string_literal: true

class Table
  attr_accessor :min_x_unit, :max_x_unit, :min_y_unit, :max_y_unit

  def initialize(x_units, y_units)
    @min_x_unit = 0
    @min_y_unit = 0
    # x_units = 5 ? max_x_unit = 4 as we start counting from 0
    @max_x_unit = x_units - 1
    @max_y_unit = y_units - 1
  end

  # The coordinates must be >= min_unit and <= max_unit for the table
  # Parameters:
  #   coordinates: of type Position::Coordinates
  #
  # Returns:
  #   true if coordinates are on the table
  #   false if coordinates are not on the table
  def place_valid?(coordinates)
    x_coordinate = coordinates.x_coordinate
    y_coordinate = coordinates.y_coordinate

    (x_coordinate >= @min_x_unit) &&
      (x_coordinate <= @max_x_unit) &&
      (y_coordinate >= @min_y_unit) &&
      (y_coordinate <= @max_y_unit)
  end
end
