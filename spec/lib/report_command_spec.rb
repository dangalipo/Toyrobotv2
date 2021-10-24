# frozen_string_literal: true

require 'spec_helper'

describe ReportCommand do
  describe '#execute' do
    let(:unparsed_command) { 'REPORT' }
    let(:table_top) { TableTop.new }
    let(:robot) { Robot.new(table_top: table_top) }
    subject(:report) { ReportCommand.new(robot, unparsed_command).execute }

    context 'robot has been placed' do
      let(:direction) { table_top.find_direction_by_name('EAST') }
      let(:coordinates) { Coordinates.new(x_coordinate: 1, y_coordinate: 1) }
      before do
        robot.place(coordinates, direction)
      end

      specify { expect { report }.to output("1,1,EAST\n").to_stdout }
    end

    context 'robot has not been placed' do
      specify { expect { report }.not_to output("1,1,EAST\n").to_stdout }
    end
  end
end
