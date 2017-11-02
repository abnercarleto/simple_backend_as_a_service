require 'rails_helper'

RSpec.describe Api::Resource, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :definition_model_id }
    it { is_expected.to validate_presence_of :content }
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
