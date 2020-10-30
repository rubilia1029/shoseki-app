FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    author {Faker::Name.name}
    category_id { 2 }
    association :user
    after(:build) do |book|
      book.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end  