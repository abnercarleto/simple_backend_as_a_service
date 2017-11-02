FactoryBot.define do
  factory :definition_attribute, class: 'Definition::Attribute' do
    name "MyString"
    kind :int
  end
end
