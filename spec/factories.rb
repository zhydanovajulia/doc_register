FactoryBot.define do

  file_pdf = Rails.root.join("spec/support/story.pdf").to_s

  factory :user do
    email { "qwe@qwe.qwe" }
    password { "epyfnm" }
  end

  factory :document do
    user
    sequence(:name) { |n| "Document #{n}"}
    title { "The standard Lorem Ipsum passage, used since the 1500s" }
    description { "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
    transient do
      file_count { 1 }
    end

    factory :document_with_pdf_attachment do
       after(:create) do |document, evaluator|
        create_list(:attachment, evaluator.file_count, attachable: document)
      end
    end
  end

  factory :attachment do
    association :attachable, factory: :document
    data { fixture_file_upload file_pdf, 'application/pdf' }
  end
end
