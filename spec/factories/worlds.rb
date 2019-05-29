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
end
