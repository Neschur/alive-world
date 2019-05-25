FactoryBot.define do
  factory :simple_world_2x2, class: World do
    initialize_with do
      ground = [
        [Entity.new(:land), Entity.new(:land)],
        [Entity.new(:land), Entity.new(:land)],
      ]
      new(ground)
    end
  end
end
