require 'rails_helper'

RSpec.describe Definition::Model, type: :model do
  describe 'validations' do
    subject { build :definition_model }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe 'associations' do
    it do
      is_expected.to have_many(:definition_attributes).
                     class_name('Definition::Attribute').
                     inverse_of(:definition_model)
    end
  end
end
