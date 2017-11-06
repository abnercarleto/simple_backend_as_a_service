FactoryBot.define do
  factory :api_resource, class: 'Api::Resource' do
    content Hash.new

    factory :product_resource do
      content { { name: 'Chess wooden', price: 50.0, amount: 80 } }
    end
  end
end
