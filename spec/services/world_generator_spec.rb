require 'rails_helper'

describe WorldGenerator do
  subject(:generator) { described_class.new(size: { x: 2, y: 2 }) }

  describe '#new' do
    it 'accepts sizex and sizey' do
      expect { generator }.to_not raise_error
    end
  end

  describe '#call' do
    subject(:world) { generator.call }

    it 'generate world accordings sizes with entities' do
      expect(world).to be_a(World)
      expect(world.ground).to be_a(Ground)

      # expect(world.ground.size).to eq(2)
      world.ground.data.each do |line|
        expect(line).to be_a(Array)
        expect(line.size).to eq(2)

        line.each do |point|
          expect(point).to be_a(Point)

          expect(point.landscape).not_to be_nil
        end
      end
    end
  end
end
