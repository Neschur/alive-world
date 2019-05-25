require 'rails_helper'

describe WorldGenerator do
  subject(:generator) { described_class.new(sizex: 2, sizey: 2) }

  describe '#new' do
    it 'accepts sizex and sizey' do
      expect { generator }.to_not raise_error
    end
  end

  describe '#call' do
    subject(:world) { generator.call }

    it 'generate world accordings sizes with entities' do
      expect(world).to be_a(World)
      expect(world.ground).to be_a(Array)
      expect(world.ground.size).to eq(2)
      world.ground.each do |line|
        expect(line).to be_a(Array)
        expect(line.size).to eq(2)

        line.each do |entity|
          expect(entity).to be_a(Entity)
        end
      end
    end
  end
end
