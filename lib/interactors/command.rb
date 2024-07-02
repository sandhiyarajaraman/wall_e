# frozen_string_literal: true

class Command
  BAD_COMMAND_CALL_ERROR = 'Command is called without table or robot object'

  # context must contain:
  #   robot: object of Robot class
  #   table: object of Position class
  def validate_call
    return unless (context.robot.class != Robot) || (context.table.class != Table)

    context.fail!(message: BAD_COMMAND_CALL_ERROR)
  end
end
