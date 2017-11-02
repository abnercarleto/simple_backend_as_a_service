require 'rails_helper'

RSpec.describe Definition::Attribute, type: :model do
  describe 'validations' do
    subject { build :definition_attribute, definition_model: build(:definition_model) }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :kind }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:definition_model_id) }
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:definition_model).
                     class_name('Definition::Model').
                     with_foreign_key(:definition_model_id).
                     dependent(:destroy)
    end
  end
end
