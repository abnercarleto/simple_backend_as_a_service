FactoryBot.define do
  factory :definition_attribute, class: 'Definition::Attribute' do
    name "MyString"
    kind :int

    factory :name_attribute do
      name 'name'
      kind :string
    end

    factory :price_attribute do
      name 'price'
      kind :decimal
    end

    factory :amount_attribute do
      name 'amount'
      kind :int
    end
  end
end
