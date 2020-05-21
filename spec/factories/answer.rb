FactoryBot.define do

  factory :answer do
    text               {"まずは板の中心を意識しましょう！"}
    video              {"597395760.552812.MP4"}
    image              {"01.jpg"}
    user_id            {1}
    question_id        {1}

    association :question, factory: :question
    association :user, factory: :user
  end
end