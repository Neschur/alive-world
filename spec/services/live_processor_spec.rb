require 'rails_helper'

describe LiveProcessor do
  subject(:generator) { described_class.new(world) }

  let(:world) { build(:random_world_100x100) }

  describe '#new' do
    it do
      expect { generator }.to_not raise_error
    end
  end

  describe '#step' do
    it do
      generator.step
    end
  end
end
