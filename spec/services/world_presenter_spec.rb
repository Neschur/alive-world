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

    it 'save world to database' do
      expect(presentation).to eq([
        [:stone, :land],
        [:land, :grazer],
      ])
    end
  end
end
