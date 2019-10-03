FactoryBot.define do
  factory :user do
    email { "qwe@qwe.qwe" }
    password { "epyfnm" }
  end

  factory :document do
    association :user
    sequence(:name) { |n| "Document #{n}"}
    title { "The standard Lorem Ipsum passage, used since the 1500s" }
    description { "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
  end

  factory :attachment do
    association :document
  end
end
