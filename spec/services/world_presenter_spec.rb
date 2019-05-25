require 'rails_helper'

describe WorldPresenter do
  subject(:presenter) { described_class.new(world) }

  let(:world) { build(:simple_world_2x2) }

  describe '#new' do
    it 'accepts world' do
      expect { presenter }.to_not raise_error
    end
  end

  describe '#data' do
    subject(:presentation) { presenter.data }

    let(:land_colour) { described_class::COLOURS[:land] }

    it 'save world to database' do
      expect(presentation).to eq([
        [land_colour, land_colour],
        [land_colour, land_colour],
      ])
    end
  end
end
