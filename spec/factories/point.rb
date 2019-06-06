FactoryBot.define do
  factory :point, class: Point do
    trait :land do
      initialize_with do
        new(build(:entity, :land))
      end
    end

    trait :stone do
      initialize_with do
        new(build(:entity, :stone))
      end
    end

    trait :with_grazer do
      initialize_with do
        point = new(build(:entity, :land))
        point.push_entity!(build(:entity, :grazer))
        point
      end
    end
  end
end
