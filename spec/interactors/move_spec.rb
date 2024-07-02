# frozen_string_literal: true

require 'spec_helper'

require 'models/table'
require 'models/position'
require 'models/robot'
require 'interactors/command'
require 'interactors/place'
require 'interactors/move'
require 'constants'

describe Move do
  describe '#call' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:x_coordinate) { 1 }
    let(:y_coordinate) { 2 }
    let(:direction) { 'NORTH' }
    let(:place_command) do
      Place.call(robot:, table:, x_coordinate:, y_coordinate:,
                 direction:)
    end

    let(:move_command) do
      described_class.call(robot:, table:)
    end

    before do
      place_command
    end

    context 'when invoked correctly' do
      let(:table) { Table.new(5, 5) }
      let(:x_coordinate) { 1 }
      let(:y_coordinate) { 2 }
      let(:direction) { 'NORTH' }

      it 'moves the robot one place in the direction it is facing' do # rubocop:disable RSpec/ExampleLength
        expect(robot.current_position.direction).to eq(direction)
        expect(robot.current_position.coordinates.x_coordinate).to eq(x_coordinate)
        expect(robot.current_position.coordinates.y_coordinate).to eq(y_coordinate)

        result = move_command

        expect(result).to be_success
        expect(robot.current_position.direction).to eq(direction)
        expect(robot.current_position.coordinates.x_coordinate).to eq(x_coordinate)
        # moves 1 place forward in y-direction (north)
        expect(robot.current_position.coordinates.y_coordinate).to eq(y_coordinate + 1)
      end
    end

    context 'when invoked in a corner' do
      let(:table) { Table.new(2, 2) }
      let(:x_coordinate) { 1 }
      let(:y_coordinate) { 1 }
      let(:direction) { 'NORTH' }

      it 'displays message that it cannot move' do
        result = move_command

        expect(result).not_to be_success
        expect(result.message).to eq(Move::MOVE_NOT_ALLOWED_ERROR)
      end
    end

    context 'when invoked before robot is placed,' do
      let(:table) { Table.new(2, 2) }
      let(:x_coordinate) { 1 }
      let(:y_coordinate) { 2 }
      let(:direction) { 'NORTH' }

      it 'displays error that robot is not placed' do
        result = move_command

        expect(result).not_to be_success
        expect(result.message).to eq(Robot::NOT_PLACED_ERROR)
      end
    end
  end
end
