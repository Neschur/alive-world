FactoryBot.define do
  factory :store_world, class: Store::World do
    data { build(:random_world_100x100).to_json }
  end
end
