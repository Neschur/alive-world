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

      size = world.size
      size[:lat].times do |x|
        size[:long].times do |y|
          point = world[x, y]

          expect(point).to be_a(Point)
          expect(point.landscape).not_to be_nil
        end
      end
    end
  end
end
