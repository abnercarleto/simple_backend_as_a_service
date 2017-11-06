FactoryBot.define do
  factory :definition_model, class: 'Definition::Model' do
    name "Product"

    factory :product_definition do
      definition_attributes_attributes do
        %i[name_attribute price_attribute amount_attribute].
          map { |attrib| attributes_for attrib }
      end
    end
  end
end
