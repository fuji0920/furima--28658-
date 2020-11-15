FactoryBot.define do
  factory :item do
    name                   {Faker::Internet.name}
    text                   {Faker::Internet.free_email}
    category_id            {2}
    product_status_id      {2}
    shipping_fee_status_id {2}
    shipping_area_id       {2}
    shipping_day_id        {2}
    price                  {4000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end

  end
end
