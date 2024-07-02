# frozen_string_literal: true

require 'spec_helper'

require 'models/table'
require 'models/position'
require 'constants'

describe Table do
  let(:max_x_unit) { 5 }
  let(:max_y_unit) { 5 }

  let(:current_position) { Position.new }

  describe '#place_valid?' do
    let(:coordinates) { Position::Coordinates.new(x_coordinate, y_coordinate) }

    context 'when coordinates are invalid' do
      let(:x_coordinate) { 6 }
      let(:y_coordinate) { 6 }

      it 'returns false' do
        table = described_class.new(max_x_unit, max_y_unit)
        expect(table.place_valid?(coordinates)).to be(false)
      end
    end

    context 'when coordinates are valid' do
      let(:x_coordinate) { 1 }
      let(:y_coordinate) { 2 }

      it 'returns true' do
        table = described_class.new(max_x_unit, max_y_unit)
        expect(table.place_valid?(coordinates)).to be(true)
      end
    end

    context 'when coordinates are negative' do
      let(:x_coordinate) { -1 }
      let(:y_coordinate) { -2 }

      it 'returns false' do
        table = described_class.new(max_x_unit, max_y_unit)
        expect(table.place_valid?(coordinates)).to be(false)
      end
    end
  end
end
