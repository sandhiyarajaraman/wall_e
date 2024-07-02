# frozen_string_literal: true

require 'spec_helper'

require 'models/table'
require 'models/position'
require 'models/robot'
require 'interactors/command'
require 'interactors/place'
require 'constants'

describe Place do
  describe '#call' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:x_coordinate) { 1 }
    let(:y_coordinate) { 2 }
    let(:direction) { 'NORTH' }
    let(:place_command) do
      described_class.call(robot:, table:, x_coordinate:, y_coordinate:,
                           direction:)
    end

    context 'when invoked correctly' do
      it 'places the robot on the table in the right place' do
        result = place_command

        expect(result).to be_success
        expect(robot.current_position.direction).to eq(direction)
        expect(robot.current_position.coordinates.x_coordinate).to eq(x_coordinate)
        expect(robot.current_position.coordinates.y_coordinate).to eq(y_coordinate)
      end
    end

    context 'when invoked incorrectly' do
      let(:table) { Table.new(2, 2) }
      let(:x_coordinate) { 1 }
      let(:y_coordinate) { 2 }

      it 'displays error message' do
        result = place_command

        expect(result).not_to be_success
        expect(result.message).to eq(Place::INVALID_PLACE_ERROR)
      end
    end
  end
end
