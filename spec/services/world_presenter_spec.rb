require 'rails_helper'

describe WorldPresenter do
  subject(:presenter) { described_class.new(world) }

  let(:world) { WorldGenerator.new(sizex: 2, sizey: 2).call }

  describe '#new' do
    it 'accepts world' do
      expect { presenter }.to_not raise_error
    end
  end

  describe '#save!' do
    subject(:presentation) { presenter.data }

    it 'save world to database' do
      expect(presentation).to eq([
        ['#00ac17', '#00ac17'],
        ['#00ac17', '#00ac17'],
      ])
    end
  end
end
