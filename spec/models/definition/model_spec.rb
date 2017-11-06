require 'rails_helper'

RSpec.describe Definition::Model, type: :model do
  subject { build :definition_model }

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe 'associations' do
    it do
      is_expected.to have_many(:definition_attributes).
                     class_name('Definition::Attribute').
                     inverse_of(:definition_model).
                     dependent(:destroy)
    end

    it do
      is_expected.to have_many(:api_resources).
                     class_name('Api::Resource').
                     inverse_of(:definition_model).
                     dependent(:destroy)
    end

    describe 'nested attributes' do
      it do
        is_expected.to accept_nested_attributes_for(:definition_attributes).
                       allow_destroy(true)
      end
    end
  end

  describe 'before_save' do
    describe '#generate_slug' do
      it 'slug is generate on save' do
        expect { subject.save }.to change(subject, :slug).from(nil).to(subject.name.underscore.pluralize)
      end
    end
  end
end
