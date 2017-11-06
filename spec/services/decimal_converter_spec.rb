require 'rails_helper'

RSpec.describe DecimalConverter, type: :service do
  describe '#call' do
    let!(:product_definition) { create :product_definition }
    let(:api_resource) { Api::Resource.new definition_model: product_definition }

    context 'success' do
      let(:service) { DecimalConverter.new api_resource, :price, '20.67' }

      it 'convert without errors' do
        service.call
        expect(api_resource.errors.any?).to be false
      end

      it 'convert and set content value' do
        service.call
        expect(api_resource.content[:price]).to eq 20.67
      end
    end

    context 'error' do
      let(:service) { DecimalConverter.new api_resource, :price, 'foo' }

      it 'has error' do
        service.call
        expect(api_resource.errors.any?).to be true
      end
    end
  end
end
