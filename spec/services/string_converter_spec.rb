require 'rails_helper'

RSpec.describe StringConverter, type: :service do
  describe '#call' do
    let!(:product_definition) { create :product_definition }
    let(:api_resource) { Api::Resource.new definition_model: product_definition }

    context 'when value is a string' do
      let(:service) { StringConverter.new api_resource, :name, 'Chess wooden' }

      it 'convert without errors' do
        service.call
        expect(api_resource.errors.any?).to be false
      end

      it 'convert and set content value' do
        service.call
        expect(api_resource.content[:name]).to eq 'Chess wooden'
      end
    end

    context 'when value is not a string' do
      let(:service) { StringConverter.new api_resource, :amount, 10 }

      it 'convert without errors' do
        service.call
        expect(api_resource.errors.any?).to be false
      end

      it 'convert and set content value' do
        service.call
        expect(api_resource.content[:amount]).to eq '10'
      end
    end
  end
end
