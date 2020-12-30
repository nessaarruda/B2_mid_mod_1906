FactoryBot.define do
  factory :book do
    title { Faker::Book.title}
    publication_year { Faker::Number.within(range: 1900..2020)}
    number_of_pages { Faker::Number.within(range: 100..500)}
  end
end
