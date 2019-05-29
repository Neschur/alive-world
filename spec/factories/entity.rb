FactoryBot.define do
  factory :entity, class: Entity do
    trait :land do
      initialize_with do
        new(:land)
      end
    end

    trait :stone do
      initialize_with do
        new(:stone)
      end
    end

    trait :grazer do
      initialize_with do
        new(:grazer)
      end
    end
  end
end
