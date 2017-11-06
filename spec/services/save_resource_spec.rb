require 'rails_helper'

RSpec.describe SaveResource, type: :service do
  describe '#call' do
    let!(:product_definition) { create :product_definition }
    let(:service) { SaveResource.new api_resource, attributes }

    context 'when save new' do
      let(:api_resource) { Api::Resource.new definition_model: product_definition }
      context 'success' do
        let(:attributes) do
          ActiveSupport::HashWithIndifferentAccess.new({
            name: 'Chess wooden',
            price: '50.0',
            amount: '10'
          })
        end

        it 'save Api::Resource' do
          service.call
          expect(api_resource.persisted?).to be true
        end

        it 'convert values' do
          service.call
          expect(api_resource.content).to eq({ 'name' => 'Chess wooden', 'price' => 50.0, 'amount' => 10 })
        end
      end

      context 'when fail' do
        let(:attributes) do
          ActiveSupport::HashWithIndifferentAccess.new({
            name: 'Chess wooden',
            price: '50.0',
            amount: '2017-10-10'
          })
        end

        it 'not save Api::Resource' do
          service.call
          expect(api_resource.persisted?).to be false
        end
      end
    end
  end
end
