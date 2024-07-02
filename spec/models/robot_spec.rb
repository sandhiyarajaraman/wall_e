# frozen_string_literal: true

require 'spec_helper'

require 'cli/ui'
require 'models/position'
require 'models/robot'
require 'constants'

describe Robot do
  let(:x_coordinate) { 1 }
  let(:y_coordinate) { 2 }
  let(:direction) { 'NORTH' }
  let(:robot) { described_class.new(current_position) }
  let(:current_position) { nil }

  describe '#print_position' do
    context 'when robot is not placed' do
      it 'prints error message' do
        allow($stdout).to receive(:puts)
        robot.print_position

        expect($stdout).to have_received(:puts).with(/^.*#{Robot::NOT_PLACED_ERROR}.*$/)
      end
    end

    context 'when robot is placed' do
      let(:current_position) { Position.new(x_coordinate, y_coordinate, direction) }

      it 'prints position as text' do
        allow($stdout).to receive(:puts)
        robot.print_position

        expect($stdout).to have_received(:puts).with(/^.*#{current_position}.*$/)
      end
    end
  end

  describe '#not_positioned?' do
    context 'when robot is not placed' do
      it 'returns true' do
        expect(robot.not_positioned?).to be(true)
      end
    end

    context 'when robot is placed' do
      let(:current_position) { Position.new(x_coordinate, y_coordinate, direction) }

      it 'returns false' do
        expect(robot.not_positioned?).to be(false)
      end
    end
  end
end
