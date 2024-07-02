# frozen_string_literal: true

require 'spec_helper'

require 'models/table'
require 'models/position'
require 'models/robot'
require 'interactors/command'
require 'interactors/place'
require 'interactors/turn_left'
require 'interactors/run_command'
require 'constants'

describe RunCommand do
  describe '#call' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }

    test_cases = {
      'PLACE 1,2,NORTH': nil,
      'PLACEEEE 22,33,BLABLA': RunCommand::INVALID_COMMAND_ERROR
    }

    test_cases.each do |command, expected_message|
      context "when given command is: '#{command}'" do
        it 'returns the expected message' do
          result = described_class.call(robot:, table:, command: command.to_s)

          expect(result.message).to eq(expected_message)
        end
      end
    end
  end
end
