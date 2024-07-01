# frozen_string_literal: true

require 'interactor'

class Report < Command
  include Interactor

  def validate_call
  end

  def call
    validate_call

    context.robot.report_position
  end
end
