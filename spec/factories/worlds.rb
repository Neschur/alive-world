FactoryBot.define do
  factory :simple_world_2x2, class: World do
    initialize_with do
      ground = [
        [build(:point, :stone), build(:point, :land)],
        [build(:point, :land), build(:point, :with_grazer)],
      ]
      new(ground)
    end
  end

  factory :random_world_100x100, class: World do
    initialize_with do
      WorldGenerator.new(size: { x: 100, y: 100 }).call
    end
  end
end
