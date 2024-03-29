# frozen_string_literal: true

require 'spec_helper'

describe PlaceCommand do
  describe '#execute' do
    let(:table_top) { TableTop.new }
    let(:robot) { Robot.new(table_top: table_top) }
    subject(:place) { PlaceCommand.new(robot, unparsed_command).execute }

    context 'valid place command' do
      let(:unparsed_command) { 'PLACE 0,0,WEST' }

      specify { expect { place }.to change(robot, :x_position).to(0) }
      specify { expect { place }.to change(robot, :y_position).to(0) }
      specify { expect { place }.to change(robot, :direction_name).to('WEST') }
    end

    context 'invalid place command' do
      context 'position outside of table_top' do
        let(:unparsed_command) { 'PLACE 10,-10,WEST' }

        specify do
          expect { place }.to raise_error(PlaceCommand::InvalidPositionError,
                                          'Cannot place Robot at 10,-10 as it is not on the table.')
        end
      end

      context 'direction not in table_top' do
        let(:unparsed_command) { 'PLACE 0,0,NORTHWEST' }

        specify do
          expect { place }.to raise_error(PlaceCommand::InvalidDirectionError,
                                          'Cannot place Robot facing NORTHWEST as it is not a valid direction.')
        end
      end
    end
  end
end
