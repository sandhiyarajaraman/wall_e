# frozen_string_literal: true

require 'spec_helper'

require 'models/table'
require 'models/position'
require 'models/robot'
require 'interactors/command'
require 'interactors/place'
require 'interactors/turn_left'
require 'constants'

describe TurnLeft do
  describe '#call' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:turn_left_command) { described_class.call(robot:) }

    test_cases = {
      NORTH: 'WEST',
      WEST: 'SOUTH',
      SOUTH: 'EAST',
      EAST: 'NORTH'
    }

    test_cases.each do |facing, turn_to|
      context "when facing #{facing}" do
        before do
          Place.call(robot:, table:, x_coordinate: 1, y_coordinate: 1,
                     direction: facing.to_s)
        end

        it "turns #{turn_to}" do
          result = turn_left_command

          expect(result).to be_success
          expect(robot.current_position.direction).to eq(turn_to)
          expect(robot.current_position.coordinates.x_coordinate).to eq(1)
          expect(robot.current_position.coordinates.y_coordinate).to eq(1)
        end
      end
    end
  end
end
