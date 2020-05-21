FactoryBot.define do

  factory :question do
    title              {"カービング教えてください"}
    text               {"やったことないのでお手やらかに！"}
    video              {"597395760.552812.MP4"}
    image              {"01.jpg"}
    user_id            {1}
    category_id        {1}
    association :user, factory: :user
    association :category, factory: :category
  end
end