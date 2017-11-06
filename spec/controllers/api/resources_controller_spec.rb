require 'rails_helper'

RSpec.describe Api::ResourcesController, type: :controller do
  let(:product_definition) { create(:product_definition) }
  let(:valid_attributes) { attributes_for(:product_resource)[:content] }
  let(:model_attributes) { attributes_for(:product_resource, definition_model_id: product_definition.id) }
  let(:invalid_attributes) do
    {
      model_slug: product_definition.slug,
      api_resource: attributes_for(:product_resource,
                                   definition_model_id: nil,
                                   amount: 'invalid amount')
     }
  end
  let(:valid_session) { {} }
  let(:default_params) { { model_slug: product_definition.slug } }

  describe "GET #index" do
    it "returns a success response" do
      model = Api::Resource.create! model_attributes
      get :index, params: default_params, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      model = Api::Resource.create! model_attributes
      get :show, params: default_params.merge({id: model.to_param}), session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Definition::Model" do
        expect {
          post :create, params: default_params.merge({api_resource: valid_attributes}), session: valid_session
        }.to change(Api::Resource, :count).by(1)
      end

      it "renders a JSON response with the new definition_model" do

        post :create, params: default_params.merge({api_resource: valid_attributes}), session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api_resource_path(product_definition.slug, Api::Resource.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new definition_model" do

        post :create, params: invalid_attributes, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:update_attributes) {
        valid_attributes.merge({ name: 'NewName' })
      }

      it "updates the requested definition_model" do
        model = Api::Resource.create! model_attributes

        model.reload
        expect {
          put :update, params: default_params.merge(api_resource: update_attributes, id: model.id), session: valid_session
        }.to change { model.reload.content }.
             from(valid_attributes.stringify_keys).
             to(update_attributes.stringify_keys)
      end

      it "renders a JSON response with the definition_model" do
        model = Api::Resource.create! model_attributes

        put :update, params: default_params.merge(api_resource: update_attributes, id: model.id), session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the definition_model" do
        model = Api::Resource.create! model_attributes

        put :update, params: invalid_attributes.merge({ id: model.id }), session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
