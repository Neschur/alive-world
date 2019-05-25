require 'rails_helper'

describe WorldPersister do
  subject(:persister) { described_class.new(world) }

  let(:world) { WorldGenerator.new(sizex: 2, sizey: 2).call }

  describe '#new' do
    it 'accepts world' do
      expect { persister }.to_not raise_error
    end
  end

  describe '#save!' do
    it 'save world to database' do
      persister.save!
    end
  end
end
