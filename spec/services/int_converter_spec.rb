require 'rails_helper'

RSpec.describe IntConverter, type: :service do
  describe '#call' do
    let!(:product_definition) { create :product_definition }
    let(:api_resource) { Api::Resource.new definition_model: product_definition }

    context 'success' do
      let(:service) { IntConverter.new api_resource, :amount, '10' }

      it 'convert without errors' do
        service.call
        expect(api_resource.errors.any?).to be false
      end

      it 'convert and set content value' do
        service.call
        expect(api_resource.content[:amount]).to eq 10
      end
    end

    context 'error' do
      let(:service) { IntConverter.new api_resource, :amount, '10.0' }

      it 'has error' do
        service.call
        expect(api_resource.errors.any?).to be true
      end
    end
  end
end
