# frozen_string_literal: true

require 'spec_helper'

describe Direction do
  let(:direction) do
    Direction.new(name: name,
                  move_x: move_x,
                  move_y: move_y)
  end
  let(:name)    { 'WEST' }
  let(:move_x)  { 1 }
  let(:move_y)  { 0 }

  describe '#name' do
    subject { direction.name }

    it { is_expected.to eq(name) }
  end

  describe '#move_x' do
    subject { direction.move_x }

    it { is_expected.to eq(move_x) }
  end

  describe '#move_y' do
    subject { direction.move_y }

    it { is_expected.to eq(move_y) }
  end
end
