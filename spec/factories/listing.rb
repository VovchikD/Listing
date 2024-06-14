# frozen_string_literal: true

FactoryBot.define do
  factory :listing do
    brand { "Toyota" }
    model { "Camry" }
    body_type { "Sedan"}
    trip { 10000 }
    color { "Red" }
    price { 20000 }
    fuel { "Petrol" }
    year { 2020 }
    engine_capacity { 2.5 }
    phone_number { "1234567890" }
    name { "John Doe" }
  end
end