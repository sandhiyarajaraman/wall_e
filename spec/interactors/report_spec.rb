# frozen_string_literal: true

require 'spec_helper'

require 'cli/ui'
require 'models/table'
require 'models/position'
require 'models/robot'
require 'interactors/command'
require 'interactors/place'
require 'interactors/report'
require 'constants'

describe Report do
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

    let(:report_command) do
      described_class.call(robot:, table:)
    end

    context 'when invoked correctly' do
      before do
        place_command
      end

      let(:table) { Table.new(5, 5) }
      let(:x_coordinate) { 1 }
      let(:y_coordinate) { 2 }
      let(:direction) { 'NORTH' }

      let(:expected_position) do
        Position.new(x_coordinate, y_coordinate, direction)
      end

      it 'reports the location of the robot' do
        allow($stdout).to receive(:puts)
        report_command
        expect($stdout).to have_received(:puts).with(/^.*#{expected_position}.*$/)
      end
    end

    context 'when invoked before robot is placed,' do
      it 'displays error that robot is not placed' do
        allow($stdout).to receive(:puts)
        result = report_command
        expect(result.message).to eq(Robot::NOT_PLACED_ERROR)
      end
    end
  end
end
