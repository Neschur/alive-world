FactoryBot.define do
  factory :point, class: Point do
    trait :land do
      initialize_with do
        point = new
        point.push_entity(build(:entity, :land))
        point
      end
    end

    trait :stone do
      initialize_with do
        point = new
        point.push_entity(build(:entity, :stone))
        point
      end
    end

    trait :with_grazer do
      initialize_with do
        point = new
        point.push_entity(build(:entity, :land))
        point.push_entity(build(:entity, :grazer))
        point
      end
    end
  end
end
