# frozen_string_literal: true

require 'spec_helper'

require 'models/position'
require 'constants'

describe Position do
  let(:x_coordinate) { 2 }
  let(:y_coordinate) { 3 }
  let(:direction) { 'NORTH' }
  let(:position) { described_class.new(x_coordinate, y_coordinate, direction) }

  describe '#next_coordinates' do
    context 'when moving NORTH' do
      let(:direction) { 'NORTH' }

      it 'increases y coordinate by 1 unit' do
        expected_coordinates = Position::Coordinates.new(x_coordinate, y_coordinate + 1)
        expect(position.next_coordinates).to eq(expected_coordinates)
      end
    end

    context 'when moving EAST' do
      let(:direction) { 'EAST' }

      it 'increases x coordinate by 1 unit' do
        expected_coordinates = Position::Coordinates.new(x_coordinate + 1, y_coordinate)
        expect(position.next_coordinates).to eq(expected_coordinates)
      end
    end

    context 'when moving SOUTH' do
      let(:direction) { 'SOUTH' }

      it 'decreases y coordinate by 1 unit' do
        expected_coordinates = Position::Coordinates.new(x_coordinate, y_coordinate - 1)
        expect(position.next_coordinates).to eq(expected_coordinates)
      end
    end

    context 'when moving WEST' do
      let(:direction) { 'WEST' }

      it 'decreases x coordinate by 1 unit' do
        expected_coordinates = Position::Coordinates.new(x_coordinate - 1, y_coordinate)
        expect(position.next_coordinates).to eq(expected_coordinates)
      end
    end
  end

  describe '#move_to_next_coordinates' do
    context 'when invoked' do
      it 'assignes new coordinates to Position object' do
        # Moving North
        expected_coordinates = Position::Coordinates.new(x_coordinate, y_coordinate + 1)
        position.move_to_next_coordinates

        expect(position.coordinates).to eq(expected_coordinates)
      end
    end
  end

  describe '#to_s' do
    context 'when invoked' do
      it 'prints out a stylised string representation of the position' do
        expect(position.to_s).to eq(
          "Position => X: #{x_coordinate}, Y: #{y_coordinate}, Facing: #{direction}"
        )
      end
    end
  end

  describe '#turn_right' do
    test_cases = {
      NORTH: 'EAST',
      EAST: 'SOUTH',
      SOUTH: 'WEST',
      WEST: 'NORTH'
    }

    test_cases.each do |facing, turn_to|
      context "when facing #{facing}" do
        let(:direction) { facing.to_s }

        it "sets direction to #{turn_to}" do
          position.turn_right

          expect(position.direction).to eq(turn_to)
          # Leaves coordinates untouched
          expect(position.coordinates.x_coordinate).to eq(x_coordinate)
          expect(position.coordinates.y_coordinate).to eq(y_coordinate)
        end
      end
    end
  end

  describe '#turn_left' do
    test_cases = {
      NORTH: 'WEST',
      WEST: 'SOUTH',
      SOUTH: 'EAST',
      EAST: 'NORTH'
    }

    test_cases.each do |facing, turn_to|
      context "when facing #{facing}" do
        let(:direction) { facing.to_s }

        it "sets direction to #{turn_to}" do
          position.turn_left

          expect(position.direction).to eq(turn_to)
          # Leaves coordinates untouched
          expect(position.coordinates.x_coordinate).to eq(x_coordinate)
          expect(position.coordinates.y_coordinate).to eq(y_coordinate)
        end
      end
    end
  end
end
