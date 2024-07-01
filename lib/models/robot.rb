# frozen_string_literal: true

class Robot
  attr_accessor :current_position

  NOT_PLACED_ERROR = 'Robot is not placed on the table.'

  def initialize(position = nil)
    # position is an object of type Position
    @current_position = position
  end

  def report_position
    puts CLI::UI.fmt "{{red:#{NOT_PLACED_ERROR}}}" if not_positioned?

    puts CLI::UI.fmt "{{yellow:#{@current_position}}}"
  end

  def not_positioned?
    @current_position.nil?
  end
end
