# frozen_string_literal: true

class Robot
  attr_accessor :current_position

  NOT_PLACED_ERROR = 'Robot is not placed on the table.'

  def initialize(position = nil)
    # position is an object of type Position
    @current_position = position
  end

  def report_position
    if not_positioned?
      puts 'Robot is not placed on the table. ' \
           'Run command `PLACE X,Y,FACING` to start the game. ' \
           'X and Y are coordinates. ' \
           'FACING is a direction.'
    end

    puts @current_position
  end

  def not_positioned?
    @current_position.nil?
  end
end
