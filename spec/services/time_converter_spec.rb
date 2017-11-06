require 'rails_helper'

RSpec.describe TimeConverter, type: :service do
  describe '#call' do
    let!(:product_definition) { create :product_definition }
    let(:api_resource) { Api::Resource.new definition_model: product_definition }

    context 'success' do
      let(:service) { TimeConverter.new api_resource, :date, '2017-10-10 02:02:00' }

      it 'convert without errors' do
        service.call
        expect(api_resource.errors.any?).to be false
      end

      it 'convert and set content value' do
        service.call
        expect(api_resource.content[:date]).to eq Time.new(2017,10,10, 2, 2, 0)
      end
    end

    context 'error' do
      let(:service) { TimeConverter.new api_resource, :date, '10.0' }

      it 'has error' do
        service.call
        expect(api_resource.errors.any?).to be true
      end
    end
  end
end
